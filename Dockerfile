FROM ubuntu:impish

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    curl -sL https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    curl -sL https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    apt-get -y install openssh-server git git-lfs gitlab-runner gpg curl buildah gnupg nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd
RUN mkdir ~/.ssh
RUN chmod 700 ~/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
