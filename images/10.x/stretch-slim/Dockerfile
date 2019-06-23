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
    sudo ./env/bin/pip3 install \
        pillow \
        pytesseract \
        wand \
    ;
