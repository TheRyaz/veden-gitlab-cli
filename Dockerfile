FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y wget xz-utils && \
    apt-get clean && \
    wget https://nodejs.org/dist/v7.2.1/node-v7.2.1-linux-x64.tar.xz && \
    tar -xvf /node-v7.2.1-linux-x64.tar.xz && \
    rm /node-v7.2.1-linux-x64.tar.xz

ENV PATH /node-v7.2.1-linux-x64/bin:$PATH

RUN npm install -g gitlab-cli

RUN mkdir -p /root/.config/gitlab-cli
COPY ./files/default.js /root/.config/gitlab-cli/

ENTRYPOINT ["gitlab", "--config=/root/.config/gitlab-cli/default.js"]
