FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common --no-install-recommends ca-certificates curl jq iputils-ping libcurl4 libunwind8 netcat curl dnsutils file ftp iproute2 iputils-ping locales openssh-client rsync shellcheck telnet time unzip wget zip apt-transport-https dirmngr gpg-agent yamllint && \
  rm -rf /var/lib/apt/lists/*

RUN \
  add-apt-repository ppa:git-core/ppa && \
  apt-get update

RUN \
  apt-get update && \
  apt-get install -y git && \
  rm -rf /var/lib/apt/lists/*

RUN \
  locale-gen en_US.UTF-8 && \
  update-locale

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends build-essential && \
  rm -rf /var/lib/apt/lists/*

RUN \
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
  chmod 700 get_helm.sh

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends maven && \
  rm -rf /var/lib/apt/lists/*

#RUN \
#  apt-get update && \
#  add-apt-respository ppa:openjdk-r/ppa

#RUN \
#  apt-get update && \
#  apt-get install -y --no-install-recommends openjdk-8-jdk && \
#  rm -rf /var/lib/apt/lists/*

#RUN \
#  apt-get update && \
#  apt-get install -y --no-install-recommends openjdk-11-jdk && \
#  rm -rf /var/lib/apt/lists/*
  
#RUN \
#  update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

RUN \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

RUN \
  curl -sL https://git.io/n-install | bash -s -- -ny - && \
  ~/n/bin/n lts && \
  npm install -g n && \
  npm install -g webpack webpack-cli --save-dev && \
  npm install -g parcel-bundler && \
  npm install -g @commitlint/cli @commitlint/config-conventional commitlint-azure-pipelines-cli && \
  npm i -g npm && \
  rm -rf ~/n

ENV HOME /root

WORKDIR /root

CMD ["bash"]
