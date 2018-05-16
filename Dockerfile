from jlkovarik/dev_base:latest
USER root
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -; apt-get update
RUN apt-get install -y libtool zlib1g-dev libyaml-dev nodejs sqlite3 libsqlite3-dev  libbz2-dev libreadline6 libreadline6-dev
RUN npm install webpack -g
RUN usermod -aG sudo dev
#sudo reqired for RVM to install required
RUN echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /.rvmdocker && chown dev /.rvmdocker
RUN apt-get install -y python3-pip libssl-dev
RUN mkdir -p /usr/local/opt/pyenv; chown dev /usr/local/opt/pyenv
USER dev
RUN sudo -H /usr/bin/pip3 install pipenv
ENV HOME /home/dev
ENV PYENV_ROOT='/usr/local/opt/pyenv'
ENV PIPENV_SHELL='/bin/bash'
ENV SHELL=/bin/bash
RUN cd /home/dev && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io -o rvm.sh && cat rvm.sh | bash -s -- --path /.rvmdocker --ignore-dotfiles
RUN ln -s /.rvmdocker/scripts/functions/version /.rvmdocker/scripts/version
RUN git clone https://github.com/pyenv/pyenv.git /usr/local/opt/pyenv/
RUN git clone https://github.com/pyenv/pyenv-virtualenv.git /usr/local/opt/pyenv/plugins/pyenv-virtualenv
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
