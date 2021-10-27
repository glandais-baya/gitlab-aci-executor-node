FROM m0ppers/gitlab-aci-executor-base

RUN apt-get update && \
    apt-get -y install curl gnupg buildah && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    rm -rf /var/lib/apt/lists/*
