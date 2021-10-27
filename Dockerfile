FROM ubuntu:hirsute

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install openssh-server git git-lfs gpg curl gnupg && \
    git lfs install && \
    curl -sL "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | os=ubuntu dist=hirsute bash && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    apt-get update && \
    apt-get -y install gitlab-runner buildah nodejs && \
    apt-get upgrade && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd
RUN mkdir ~/.ssh
RUN chmod 700 ~/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
