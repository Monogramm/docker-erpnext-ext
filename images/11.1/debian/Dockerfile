FROM monogramm/docker-erpnext:11-debian

ARG TAG
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION=11

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
    DOCKER_BUILD_DATE=${BUILD_DATE} \
    TESSDATA_PREFIX=/home/$FRAPPE_USER/tessdata

### For public repository > Start ###

RUN set -ex; \
    sudo apt-get update -q; \
    sudo apt-get install -y --no-install-recommends \
        ghostscript \
        imagemagick \
        libmagickwand-dev \
        tesseract-ocr \
    ; \
    mkdir -p $TESSDATA_PREFIX; \
    sudo chown -R $FRAPPE_USER:$FRAPPE_USER $TESSDATA_PREFIX ; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/eng.traineddata -O $TESSDATA_PREFIX/eng.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/equ.traineddata -O $TESSDATA_PREFIX/equ.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/osd.traineddata -O $TESSDATA_PREFIX/osd.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/fra.traineddata -O $TESSDATA_PREFIX/fra.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/deu.traineddata -O $TESSDATA_PREFIX/deu.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/spa.traineddata -O $TESSDATA_PREFIX/spa.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/por.traineddata -O $TESSDATA_PREFIX/por.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/ita.traineddata -O $TESSDATA_PREFIX/ita.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/nld.traineddata -O $TESSDATA_PREFIX/nld.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/ara.traineddata -O $TESSDATA_PREFIX/ara.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/tur.traineddata -O $TESSDATA_PREFIX/tur.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/rus.traineddata -O $TESSDATA_PREFIX/rus.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/jpn.traineddata -O $TESSDATA_PREFIX/jpn.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/vie.traineddata -O $TESSDATA_PREFIX/vie.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/kor.traineddata -O $TESSDATA_PREFIX/kor.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/chi_sim.traineddata -O $TESSDATA_PREFIX/chi_sim.traineddata; \
    wget -q https://raw.github.com/tesseract-ocr/tessdata/master/chi_tra.traineddata -O $TESSDATA_PREFIX/chi_tra.traineddata; \
    sudo chmod -R 755 $TESSDATA_PREFIX ; \
    sudo sed -i \
        -e 's/rights="none" pattern="PDF"/rights="read" pattern="PDF"/g' \
        /etc/ImageMagick*/policy.xml \
    ; \
    sudo rm -rf /var/lib/apt/lists/*; \
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
    bench get-app https://github.com/DOKOS-IO/mautic; \
    bench get-app --branch master https://github.com/Monogramm/erpnext_ocr

VOLUME \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_autoinstall/erpnext_autoinstall/public \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_france/erpnext_france/public \
    /home/$FRAPPE_USER/frappe-bench/apps/mautic/mautic/public \
    /home/$FRAPPE_USER/frappe-bench/apps/erpnext_ocr/erpnext_ocr/public

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
#    sudo apt-get install -y expect; \
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
