# docker-ubuntu-pipeline

## Issue 
  RUN curl -sL https://git.io/n-install | bash -s -- -ny -  && ~/n/bin/n lts  && npm install -g n  && npm install -g webpack webpack-cli --save-dev  && npm install -g parcel-bundler  && npm install -g @commitlint/cli @commitlint/config-conventional commitlint-azure-pipelines-cli  && npm i -g npm  && rm -rf ~/n

## Resolution 
  1. Upgrade Ubuntu image from 18.04 to 20.04 (unable to make 18.10 work). - See [issue](https://github.com/nodejs/node/issues/42351#issuecomment-1068424442)
  2. Use NVM to downgrade npm to v17 [stackoverflow](https://stackoverflow.com/questions/72921215/getting-glibc-2-28-not-found)
