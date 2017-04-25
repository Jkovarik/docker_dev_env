from jlkovarik/dev_base:latest
USER root
USER dev
ENV HOME /home/dev
RUN cd /home/dev && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io -o rvm.sh && cat rvm.sh | bash -s -- --ignore-dotfiles --autolibs=0 --ruby
RUN cd /home/dev && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/container-miniconda
ENV PATH $HOME/container-miniconda/bin:$PATH
