from jlkovarik/dev_base:latest
USER root
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -; apt-get update
RUN apt-get install -y libtool zlib1g-dev libyaml-dev nodejs
RUN npm install webpack -g
RUN usermod -aG sudo dev
#sudo reqired for RVM to install required
RUN echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /.rvmdocker && chown dev /.rvmdocker
RUN apt-get install -y python3-pip
USER dev
ENV HOME /home/dev
RUN /usr/bin/pip3 install pipenv
RUN cd /home/dev && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io -o rvm.sh && cat rvm.sh | bash -s -- --path /.rvmdocker --ignore-dotfiles
RUN ln -s /.rvmdocker/scripts/functions/version /.rvmdocker/scripts/version
RUN echo 'alias pipenv="/home/dev/.local/bin/pipenv"' >> ~/.bashrc
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

