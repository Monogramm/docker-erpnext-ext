FROM monogramm/docker-erpnext:12-debian

LABEL maintainer="Monogramm Maintainers <opensource at monogramm dot io>"

### For public repository > Start ###

RUN set -ex; \
    bench get-app https://github.com/britlog/erpnext_france; \
    bench get-app https://github.com/vishdha/transport_management_system; \
    bench get-app https://github.com/DOKOS-IO/mautic

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
