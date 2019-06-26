
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
* [emadshaaban92/docker-compose-erpnext](https://github.com/emadshaaban92/docker-compose-erpnext/) / [BizzoTech/docker-erpnext-ext](https://github.com/BizzoTech/docker-erpnext-ext) for the "_simple_" docker-compose setup
* [donysukardi/docker-frappe](https://github.com/donysukardi/docker-frappe) for the alpine variant (actually the source for BizzoTech images)
* [pipech/erpnext-docker-debian](https://github.com/pipech/erpnext-docker-debian) for the complete setup of apps and sites

Additional apps:
* https://github.com/britlog/erpnext_france
* https://github.com/vishdha/transport_management_system
* https://github.com/DOKOS-IO/mautic
* https://github.com/jvfiel/ERPNext-OCR (WIP due to https://github.com/jvfiel/ERPNext-OCR/issues/1)

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
* ERPNext 11
    - `11-alpine` `11` `alpine` `latest`
    - `11-debian` `debian` `11-stretch` `stretch`
    - `11-debian-slim` `debian-slim` `11-stretch-slim` `stretch-slim`
* ERPNext 10 (branch 10.x.x for latest bug fixes)
    - `10-alpine` `10`
    - `10-debian` `10-stretch`
    - `10-debian-slim` `10-stretch-slim`

# Questions / Issues
If you got any questions or problems using the image, please visit our [Github Repository](https://github.com/Monogramm/docker-erpnext-ext) and write an issue.  

# References

A list of a few issues encountered during the development of this container for future reference:
* ERPNext installs fails with Postgresql due to missing column
    * _Solution_: none so far...
    * _References_:
        * https://github.com/frappe/erpnext/issues/18028

