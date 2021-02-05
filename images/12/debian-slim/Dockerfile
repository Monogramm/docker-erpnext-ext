FROM monogramm/docker-erpnext:12-debian-slim

### For public repository > Start ###

# Build environment variables

ENV TESSDATA_PREFIX=/home/$FRAPPE_USER/tessdata \
    LC_ALL=C
 
ARG ERPNEXT_AUTOINSTALL_VERSION=1.3.1
ARG RECOD_FRAPPE_DEVTOOLS=0.9.0
ARG ERPNEXT_OCR_VERSION=1.1.1
ARG RECOD_ERPNEXT_DESIGN=1.2.0
ARG FRAPPE_PWA=1.0.2
ARG ERPNEXT_FRANCE=master
ARG MAUTIC=master

ENV FRAPPE_APP_PROTECTED='frappe erpnext erpnext_autoinstall erpnext_ocr erpnext_france mautic'
# XXX ERPNext France supported for v12+?
# XXX Mautic supported for v12+? https://github.com/dokos-io/mautic/issues/3

RUN set -ex; \
    sudo apt-get update -q; \
    sudo apt-get install -y --no-install-recommends \
        ghostscript \
        imagemagick \
        libmagickwand-dev \
        tesseract-ocr \
        libtesseract-dev \
        libleptonica-dev \
        pkg-config \
    ; \
    sudo rm -rf /var/lib/apt/lists/*; \
    mkdir -p "$TESSDATA_PREFIX"; \
    sudo chown -R "$FRAPPE_USER:$FRAPPE_USER" "$TESSDATA_PREFIX" ; \
    curl -sS -o "$TESSDATA_PREFIX/eng.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/eng.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/equ.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/equ.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/osd.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/osd.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/fra.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/fra.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/deu.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/deu.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/spa.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/spa.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/por.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/por.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/ita.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/ita.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/nld.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/nld.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/ara.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/ara.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/tur.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/tur.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/rus.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/rus.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/jpn.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/jpn.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/vie.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/vie.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/kor.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/kor.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/chi_sim.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/chi_sim.traineddata'; \
    curl -sS -o "$TESSDATA_PREFIX/chi_tra.traineddata" 'https://raw.github.com/tesseract-ocr/tessdata/master/chi_tra.traineddata'; \
    sudo chmod -R 755 "$TESSDATA_PREFIX" ; \
    sudo sed -i \
        -e 's/rights="none" pattern="PDF"/rights="read" pattern="PDF"/g' \
        /etc/ImageMagick*/policy.xml \
    ; \
    sudo mkdir -p "/home/$FRAPPE_USER"/frappe-bench/logs; \
    sudo touch "/home/$FRAPPE_USER"/frappe-bench/logs/bench.log; \
    sudo chmod 777 \
        "/home/$FRAPPE_USER"/frappe-bench/logs \
        "/home/$FRAPPE_USER"/frappe-bench/logs/* \
    ; \
    sudo chown -R "$FRAPPE_USER:$FRAPPE_USER" \
        "/home/$FRAPPE_USER"/frappe-bench/logs \
        "/home/$FRAPPE_USER"/frappe-bench/logs/* \
    ; \
    bench get-app --branch "${ERPNEXT_AUTOINSTALL_VERSION:-master}" 'https://github.com/Monogramm/erpnext_autoinstall'; \
    bench get-app --branch "${RECOD_FRAPPE_DEVTOOLS:-master}" 'https://github.com/Monogramm/recod_frappe_devtools'; \
    bench get-app --branch "${ERPNEXT_OCR_VERSION:-master}" 'https://github.com/Monogramm/erpnext_ocr'; \
    bench get-app --branch "${RECOD_ERPNEXT_DESIGN:-master}" 'https://github.com/Monogramm/recod_erpnext_design'; \
    bench get-app --branch "${FRAPPE_PWA:-master}" 'https://github.com/Monogramm/frappe_pwa'; \
    bench get-app --branch "${ERPNEXT_FRANCE:-master}" 'https://github.com/britlog/erpnext_france'; \
    bench get-app --branch "${MAUTIC:-master}" 'https://github.com/dokos-io/mautic'

VOLUME \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_autoinstall/erpnext_autoinstall/public \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_ocr/erpnext_ocr/public \
    /home/$FRAPPE_USER/frappe-bench/apps/recod_erpnext_design/recod_erpnext_design/public \
    /home/$FRAPPE_USER/frappe-bench/apps/frappe_pwa/frappe_pwa/public \
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
#COPY install_private_app.sh /home/$FRAPPE_USER/install_private_app.sh
#
#### run private install script
#RUN set -ex; \
#    sudo chmod +x \
#        "/home/$FRAPPE_USER"/install_private_app.sh \
#    ; \
#    sudo apt-get install -y expect; \
#    set +x; \
#    sync && "/home/$FRAPPE_USER"/install_private_app.sh \
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
#COPY .ssh /home/$FRAPPE_USER/
#
#### get app using SSH
#RUN set -ex; \
#    bench get-app ssh://git@github.com:22/your_account/your_repository.git
#
### For private repository: SSH > End ###

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
