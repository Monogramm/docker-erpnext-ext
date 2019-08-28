#!/bin/bash
set -eo pipefail

declare -A base=(
	[debian]='debian'
	[debian-slim]='debian'
	[alpine]='alpine'
)

declare -A compose=(
	[debian]='mariadb'
	[debian-slim]='mariadb'
	[alpine]='postgres'
)

variants=(
	debian
	debian-slim
	alpine
)

#### this is not the best practice to put password in a git repository
#### so please be super careful with your code and docker-image
#### PLEASE MAKE SURE YOUR REPOSITORY IN BOTH GITHUB AND DOCKERHUB IS SET TO PRIVATE
git_login=
git_password=

# version_greater_or_equal A B returns whether A >= B
function version_greater_or_equal() {
	[[ "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1" || "$1" == "$2" ]];
}

min_version=10

dockerRepo="monogramm/docker-frappe"
latests=( $( curl -fsSL 'https://api.github.com/repos/frappe/erpnext/tags' |tac|tac| \
	grep -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' | \
	sort -urV )
	10.x.x
	develop
)

# Remove existing images
echo "reset docker images"
rm -rf ./images/
mkdir -p ./images

echo "update docker images"
travisEnv=
for latest in "${latests[@]}"; do
	version=$(echo "$latest" | cut -d. -f1-2)
	major=$(echo "$latest" | cut -d. -f1-1)

	# Only add versions >= "$min_version"
	if version_greater_or_equal "$version" "$min_version"; then

		for variant in "${variants[@]}"; do
			# Create the version+variant directory with a Dockerfile.
			dir="images/$version/$variant"
			if [ -d "$dir" ]; then
				continue
			fi
			echo "generating frappe $latest [$version] ($variant)"
			mkdir -p "$dir"

			# Copy the docker files
			for name in redis_cache.conf nginx.conf .env install_private_app.sh; do
				cp "docker-$name" "$dir/$name"
				chmod 755 "$dir/$name"
				sed -i \
					-e 's/{{ NGINX_SERVER_NAME }}/localhost/g' \
				"$dir/$name"
			done

			case $latest in
				10.*|11.*) cp "docker-compose_mariadb.yml" "$dir/docker-compose.yml";;
				*) cp "docker-compose_${compose[$variant]}.yml" "$dir/docker-compose.yml";;
			esac

			template="Dockerfile-${base[$variant]}.template"
			cp "$template" "$dir/Dockerfile"

			cp ".dockerignore" "$dir/.dockerignore"
			cp -r "./hooks" "$dir/hooks"
			cp -r "./test" "$dir/"
			# XXX Only needed if you do not use travis for CI
			cp -r "docker-compose.test.yml" "$dir/docker-compose.test.yml"

			# Replace the variables.
			if [ "$latest" = "develop" ]; then
				sed -ri -e '
					s/%%VARIANT%%/'"$variant"'/g;
					s/%%ERPNEXT_VERSION%%/'"$latest"'/g;
				' "$dir/Dockerfile" "$dir/test/Dockerfile" "$dir/docker-compose.yml"
			elif [ "$latest" = "10.x.x" ]; then
				# FIXME https://github.com/frappe/frappe/issues/7737
				sed -ri -e '
					s/%%VARIANT%%/'"$variant"'/g;
					s/%%ERPNEXT_VERSION%%/10/g;
				' "$dir/Dockerfile" "$dir/test/Dockerfile" "$dir/docker-compose.yml"
			else
				sed -ri -e '
					s/%%VARIANT%%/'"$variant"'/g;
					s/%%ERPNEXT_VERSION%%/'"$major"'/g;
				' "$dir/Dockerfile" "$dir/test/Dockerfile" "$dir/docker-compose.yml"
			fi

			# Update git login / password if retrieving any private apps
			sed -ri -e '
				s/%%GIT_LOGIN%%/'"$git_login"'/g;
				s/%%GIT_PASSWORD%%/'"$git_password"'/g;
			' "$dir/Dockerfile"

			travisEnv='\n  - VERSION='"$version"' VARIANT='"$variant$travisEnv"

			if [[ $1 == 'build' ]]; then
				tag="$version-$variant"
				echo "Build Dockerfile for ${tag}"
				docker build -t ${dockerRepo}:${tag} $dir
			fi
		done

	fi

done

# update .travis.yml
travis="$(awk -v 'RS=\n\n' '$1 == "env:" && $2 == "#" && $3 == "Environments" { $0 = "env: # Environments'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
