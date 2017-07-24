from jlkovarik/dev_base:latest
USER root
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -; apt-get update
RUN apt-get install -y libtool zlib1g-dev libyaml-dev nodejs
RUN usermod -aG sudo dev
#sudo reqired for RVM to install required
RUN echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /.rvmdocker && chown dev /.rvmdocker
RUN mkdir /conda && chown dev /conda
USER dev
ENV HOME /home/dev
RUN cd /home/dev && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io -o rvm.sh && cat rvm.sh | bash -s -- --path /.rvmdocker --ignore-dotfiles
RUN cd /home/dev && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && ls / && bash Miniconda3-latest-Linux-x86_64.sh -b -p /conda/miniconda
RUN /conda/miniconda/bin/conda config --add channels conda-forge && /conda/miniconda/bin/conda config --add channels http://conda.anaconda.org/nsidc && /conda/miniconda/bin/conda config --add channels http://conda.anaconda.org/NSIDC/label/dev
ENV PATH /conda/miniconda/bin:$PATH
