FROM monogramm/docker-erpnext:11-alpine

LABEL maintainer="Monogramm Maintainers <opensource at monogramm dot io>"

RUN set -ex; \
    sudo apk add \
        imagemagick \
        tesseract-ocr \
    ; \
    bench get-app https://github.com/britlog/erpnext_france; \
    bench get-app https://github.com/vishdha/transport_management_system; \
    bench get-app https://github.com/DOKOS-IO/mautic; \
    bench get-app --branch develop https://github.com/Monogramm/ERPNext-OCR; \
    sudo ./env/bin/pip3 install \
        pillow \
        pytesseract \
        wand \
    ;
