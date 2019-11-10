FROM monogramm/docker-erpnext:12-alpine

ARG TAG
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION=12

LABEL maintainer="Monogramm Maintainers <opensource at monogramm dot io>" \
      product="ERPNext extended with additional apps" \
      version=$VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/Monogramm/docker-erpnext-ext" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="ERPNext extended with additional apps" \
      org.label-schema.description="Open Source ERP built for the web, supports manufacturing, distribution, retail, trading, services, education, non profits and healthcare." \
      org.label-schema.url="https://erpnext.com/" \
      org.label-schema.vendor="Frappé Technologies Pvt. Ltd" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

# Build environment variables
ENV DOCKER_TAG=${TAG} \
    DOCKER_VCS_REF=${VCS_REF} \
    DOCKER_BUILD_DATE=${BUILD_DATE}

### For public repository > Start ###

RUN set -ex; \
    sudo mkdir -p "/home/$FRAPPE_USER"/frappe-bench/logs; \
    sudo touch "/home/$FRAPPE_USER"/frappe-bench/logs/bench.log; \
    sudo chmod 777 \
        "/home/$FRAPPE_USER"/frappe-bench/logs \
        "/home/$FRAPPE_USER"/frappe-bench/logs/* \
    ; \
    sudo chown -R $FRAPPE_USER:$FRAPPE_USER \
        "/home/$FRAPPE_USER"/frappe-bench/logs \
        "/home/$FRAPPE_USER"/frappe-bench/logs/* \
    ; \
    bench get-app https://github.com/Monogramm/erpnext_autoinstall; \
    bench get-app https://github.com/britlog/erpnext_france; \
    bench get-app https://github.com/DOKOS-IO/mautic

VOLUME \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_autoinstall/erpnext_autoinstall/public \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_france/erpnext_france/public \
    /home/$FRAPPE_USER/frappe-bench/apps/mautic/mautic/public

### For public repository > End ###


### For private repository: HTTPS > Start ###
#
#### get git password from docker build argument or use default
##### this is not the best practice to put password in dockerfile
##### so please be super careful with your code and docker-image
##### PLEASE MAKE SURE YOUR REPOSITORY IN BOTH GITHUB AND DOCKERHUB IS SET TO PRIVATE
#ARG git_login=
#ARG git_password=
#
## Copy private install script
#ADD install_private_app.sh /home/$FRAPPE_USER/install_private_app.sh
#
#### run private install script
#RUN set -ex; \
#    sudo chmod +x \
#        /home/$FRAPPE_USER/install_private_app.sh \
#    ; \
#    sudo apk add --update expect; \
#    set +x; \
#    sync && /home/$FRAPPE_USER/install_private_app.sh \
#        $git_login \
#        $git_password \
#        your_app_name \
#        https://github.com/your_account/your_repository \
#        your_git_branch \
#    ;
#
### For private repository: HTTPS > End ###


### For private repository: SSH > Start ###
#
## Copy SSH key for access to private Git repositories
##### this is not the best practice to put SSH keys in dockerfile
##### so please be super careful with your code and docker-image
##### PLEASE MAKE SURE YOUR REPOSITORY IN BOTH GITHUB AND DOCKERHUB IS SET TO PRIVATE
#ADD .ssh /home/$FRAPPE_USER/
#
#### get app using SSH
#RUN set -ex; \
#    bench get-app ssh://git@github.com:22/your_account/your_repository.git
#
### For private repository: SSH > End ###
