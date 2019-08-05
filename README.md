
[uri_license]: http://www.gnu.org/licenses/agpl.html
[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg

[![License: AGPL v3][uri_license_image]][uri_license]
[![Build Status](https://travis-ci.org/Monogramm/docker-erpnext-ext.svg)](https://travis-ci.org/Monogramm/docker-erpnext-ext)
[![Docker Automated buid](https://img.shields.io/docker/cloud/build/monogramm/docker-erpnext-ext.svg)](https://hub.docker.com/r/monogramm/docker-erpnext-ext/)
[![Docker Pulls](https://img.shields.io/docker/pulls/monogramm/docker-erpnext-ext.svg)](https://hub.docker.com/r/monogramm/docker-erpnext-ext/)
[![](https://images.microbadger.com/badges/version/monogramm/docker-erpnext-ext.svg)](https://microbadger.com/images/monogramm/docker-erpnext-ext)
[![](https://images.microbadger.com/badges/image/monogramm/docker-erpnext-ext.svg)](https://microbadger.com/images/monogramm/docker-erpnext-ext)

# ERPNext Docker container extended with custom apps

Docker image for ERPNext with additionnal apps.

This image was inspired by several other containers developed by the community:
* [emadshaaban92/docker-compose-erpnext](https://github.com/emadshaaban92/docker-compose-erpnext/) / [BizzoTech/docker-erpnext](https://github.com/BizzoTech/docker-erpnext) for the "_simple_" docker-compose setup
* [donysukardi/docker-frappe](https://github.com/donysukardi/docker-frappe) for the alpine variant (actually the source for BizzoTech images)
* [pipech/erpnext-docker-debian](https://github.com/pipech/erpnext-docker-debian) for the complete setup of apps and sites

Additional apps:
* https://github.com/britlog/erpnext_france
* https://github.com/vishdha/transport_management_system
* https://github.com/DOKOS-IO/mautic
* https://github.com/Monogramm/ERPNext-OCR (WIP)

Check base image [Monogramm/docker-erpnext](https://github.com/Monogramm/docker-erpnext) and [Monogramm/docker-frappe](https://github.com/Monogramm/docker-frappe) for details.

:construction: **This image is still in development!**

## What is ERPNext ?

Open Source ERP built for the web.

> [erpnext.com](https://erpnext.com/)

> [github erpnext](https://github.com/frappe/erpnext)

## Supported tags

https://hub.docker.com/r/monogramm/docker-erpnext-ext/

* ERPNext develop branch
    - `develop-alpine` `develop`
    - `develop-debian` `develop-stretch`
    - `develop-debian-slim` `develop-stretch-slim`
* ERPNext 12
    - `12-alpine` `12` `alpine` `latest`
    - `12-debian` `debian`
    - `12-debian-slim` `debian-slim`
* ERPNext 11
    - `11-alpine` `11`
    - `11-debian` `debian`
    - `11-debian-slim` `debian-slim`
* ERPNext 10 (branch 10.x.x for latest bug fixes)
    - `10-alpine` `10`
    - `10-debian` `10-stretch`
    - `10-debian-slim` `10-stretch-slim`

## How to run this image ?

This image does not contain the database for ERPNext. You need to use either an existing database or a database container.

This image is designed to be used in a micro-service environment using docker-compose. There are basically 2 variants of the image you can choose from: `alpine` or `debian`.

# Running this image with docker-compose

* Select the version closest to what you want in the images folder
    * In the `docker-compose.yml`, you can comment the `build` lines, uncomment the `image` lines and edit versions to download prebuilt docker container.
* Feel free to edit variables defined in `.env` as you see fit.
* Run the docker-compose with `docker-compose up -d` and that's it.
* Now, go to http://localhost:80 to access the first run installation wizard.

# Questions / Issues
If you got any questions or problems using the image, please visit our [Github Repository](https://github.com/Monogramm/docker-erpnext-ext) and write an issue.  

# References

A list of a few issues encountered during the development of this container for future reference:
* ERPNext installs fails with Postgresql due to missing column
    * _Solution_: none so far...
    * _References_:
        * https://github.com/frappe/erpnext/issues/18028

