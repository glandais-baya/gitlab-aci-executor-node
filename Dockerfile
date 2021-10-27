FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install openssh-server git git-lfs gpg curl gnupg ca-certificates wget && \
    git lfs install && \
    curl -sL "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | os=ubuntu dist=focal bash && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    wget --no-check-certificate -qO - https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/Release.key | apt-key add - && \
    echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    apt-get update && \
    apt-get -y install gitlab-runner buildah nodejs && \
    apt-get upgrade && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd
RUN mkdir ~/.ssh
RUN chmod 700 ~/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
