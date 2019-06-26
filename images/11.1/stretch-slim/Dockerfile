FROM monogramm/docker-erpnext:11-stretch-slim

LABEL maintainer="Monogramm Maintainers <opensource at monogramm dot io>"

RUN set -ex; \
	sudo apt-get update -q; \
	sudo apt-get install -y --no-install-recommends \
        imagemagick \
        tesseract-ocr \
    ; \
	sudo rm -rf /var/lib/apt/lists/*; \
    bench get-app https://github.com/britlog/erpnext_france; \
    bench get-app https://github.com/vishdha/transport_management_system; \
    bench get-app https://github.com/DOKOS-IO/mautic; \
    bench get-app --branch master https://github.com/Monogramm/ERPNext-OCR; \
    sudo ./env/bin/pip3 install \
        pillow \
        pytesseract \
        wand \
    ;
