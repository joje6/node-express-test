FROM node:18-slim
LABEL maintainer="joje.attrs@gmail.com"
LABEL org.opencontainers.image.source https://github.com/joje6/node-express-test.git

RUN apt-get update && \
    apt-get install -y git jq telnet curl vim tzdata unzip bash procps net-tools openssl \
    && apt-get clean

# install kubectl
ENV KUBECTL_VERSION="v1.25.10"
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /app
COPY / /app

ENTRYPOINT [ "npm", "run", "start" ]
