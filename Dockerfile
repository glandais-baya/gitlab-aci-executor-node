FROM m0ppers/gitlab-aci-executor-base

RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs && \
    rm -rf /var/lib/apt/lists/*
