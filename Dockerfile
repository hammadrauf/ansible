FROM debian:bullseye
ARG ARG_POWER_USER=ansible
ARG ARG_PU_PWD=ansible
RUN apt-get update && apt-get upgrade && apt-get -y --no-install-recommends install sudo gnupg gnupg2 gnupg1 curl python3 python3-pip
RUN useradd --create-home --home-dir /home/${ARG_POWER_USER} --shell /bin/bash --system --uid 1001 --gid root --groups sudo --password "$(openssl passwd -6 ${ARG_PU_PWD})" ${ARG_POWER_USER}
USER ${ARG_POWER_USER}
WORKDIR /home/${ARG_POWER_USER}
RUN echo ${ARG_PU_PWD} | sudo -S sh -c "echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main' >> /etc/apt/sources.list.d/additional-repo.list"
RUN echo ${ARG_PU_PWD} | sudo -S apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN echo ${ARG_PU_PWD} | sudo -S apt update
RUN echo ${ARG_PU_PWD} | sudo -S apt install -y ansible
#RUN python3 -m pip install argcomplete
#RUN activate-global-python-argcomplete
ENTRYPOINT ["/bin/bash"]