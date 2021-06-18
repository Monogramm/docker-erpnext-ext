[![License: AGPL v3][uri_license_image]][uri_license]
[![Build Status](https://travis-ci.org/Monogramm/docker-erpnext-ext.svg)](https://travis-ci.org/Monogramm/docker-erpnext-ext)
[![Docker Automated buid](https://img.shields.io/docker/cloud/build/monogramm/docker-erpnext-ext.svg)](https://hub.docker.com/r/monogramm/docker-erpnext-ext/)
[![Docker Pulls](https://img.shields.io/docker/pulls/monogramm/docker-erpnext-ext.svg)](https://hub.docker.com/r/monogramm/docker-erpnext-ext/)
[![](https://images.microbadger.com/badges/version/monogramm/docker-erpnext-ext.svg)](https://microbadger.com/images/monogramm/docker-erpnext-ext)
[![](https://images.microbadger.com/badges/image/monogramm/docker-erpnext-ext.svg)](https://microbadger.com/images/monogramm/docker-erpnext-ext)

# ERPNext Docker container extended with custom apps

Docker image for ERPNext with additionnal apps.

This image was inspired by several other containers developed by the community:

-   [emadshaaban92/docker-compose-erpnext](https://github.com/emadshaaban92/docker-compose-erpnext/) / [BizzoTech/docker-erpnext](https://github.com/BizzoTech/docker-erpnext) for the "_simple_" docker-compose setup
-   [donysukardi/docker-frappe](https://github.com/donysukardi/docker-frappe) for the alpine variant (actually the source for BizzoTech images)
-   [pipech/erpnext-docker-debian](https://github.com/pipech/erpnext-docker-debian) for the complete setup of apps and sites

Additional apps:

-   <https://github.com/Monogramm/erpnext_autoinstall>
-   <https://github.com/Monogramm/erpnext_ocr>
-   <https://github.com/Monogramm/recod_frappe_devtools>
-   <https://github.com/Monogramm/recod_erpnext_design>
-   <https://github.com/Monogramm/frappe_pwa>
-   <https://github.com/britlog/erpnext_france>
-   <https://github.com/DOKOS-IO/mautic> (might be removed depending on dokos-io/mautic#3)

Possible additional apps:

-   <https://github.com/vishdha/transport_management_system> (removed due to [vishdha/transport_management_system#5](https://github.com/vishdha/transport_management_system/issues/5))

Check base image [Monogramm/docker-erpnext](https://github.com/Monogramm/docker-erpnext) and [Monogramm/docker-frappe](https://github.com/Monogramm/docker-frappe) for details.

## What is ERPNext

Open Source ERP built for the web.

> [erpnext.com](https://erpnext.com/)

> [github erpnext](https://github.com/frappe/erpnext)

## Supported tags

<https://hub.docker.com/r/monogramm/docker-erpnext-ext/>

<!-- >Docker Tags -->

-   13.5.0-debian 13.5-debian 13-debian  (`images/13/debian/Dockerfile`)
-   13.5.0-debian-slim 13.5-debian-slim 13-debian-slim  (`images/13/debian-slim/Dockerfile`)
-   13.5.0-alpine 13.5-alpine 13-alpine 13.5.0 13.5 13  (`images/13/alpine/Dockerfile`)
-   12.22.0-debian 12.22-debian 12-debian  (`images/12/debian/Dockerfile`)
-   12.22.0-debian-slim 12.22-debian-slim 12-debian-slim  (`images/12/debian-slim/Dockerfile`)
-   12.22.0-alpine 12.22-alpine 12-alpine 12.22.0 12.22 12  (`images/12/alpine/Dockerfile`)
-   11.1.x-debian 11.1-debian 11-debian  (`images/11/debian/Dockerfile`)
-   11.1.x-debian-slim 11.1-debian-slim 11-debian-slim  (`images/11/debian-slim/Dockerfile`)
-   11.1.x-alpine 11.1-alpine 11-alpine 11.1.x 11.1 11  (`images/11/alpine/Dockerfile`)
-   develop-debian  (`images/develop/debian/Dockerfile`)
-   develop-debian-slim  (`images/develop/debian-slim/Dockerfile`)
-   develop-alpine develop  (`images/develop/alpine/Dockerfile`)

<!-- <Docker Tags -->

## How to run this image ?

This image does not contain the database for ERPNext. You need to use either an existing database or a database container.

This image is designed to be used in a micro-service environment using docker-compose. There are basically 2 variants of the image you can choose from: `alpine` or `debian`.

This image can also be used as a template to build your own extended ERPNext image.

### Import private repository

This repository provides sample configuration and scripts for importing private frappe apps to ERPNext.
You can import private repositories through the following methods:

-   HTTPS login / password
-   SSH Key

> :warning: **Note: PLEASE MAKE SURE YOUR REPOSITORY IN BOTH GITHUB AND DOCKERHUB IS SET TO PRIVATE**

#### HTTPS

In order to pass the login and password to git, first:

-   `Dockerfile-***.template`: Uncomment the `For private repository: SSH` section

Then, you have two choices to set your login password:
1. `hooks/build` (RECOMMENDED): DockerHub build hook to retrieve Git Login and Password environment and pass them. You do not store the login/password in git, but simply set environment variables in DockerHub.
2. `update.sh`: Update the `git_login` and `git_password` to store password in Dockerfile. This is not the best practice to put password in a git repository so please be super careful with your code and make sure to keep your reposiroty private.

#### SSH

-   `Dockerfile-***.template`: Uncomment the `For private repository: SSH` section
-   Add your SSH deploy in `.ssh` at root of directory. This is not the best practice to put SSH keys in a git repository so please be super careful with your code and make sure to keep your reposiroty private.

## Running this image with docker-compose

-   Select the version closest to what you want in the images folder
    -   In the `docker-compose.yml`, you can comment the `build` lines, uncomment the `image` lines and edit versions to download prebuilt docker container.

-   Feel free to edit variables defined in `.env` as you see fit.

-   Run the docker-compose with `docker-compose up -d` and that's it.

-   Now, go to <http://localhost:80> to access the first run installation wizard.

## Questions / Issues

If you got any questions or problems using the image, please visit our [Github Repository](https://github.com/Monogramm/docker-erpnext-ext) and write an issue.

[uri_license]: http://www.gnu.org/licenses/agpl.html

[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg
