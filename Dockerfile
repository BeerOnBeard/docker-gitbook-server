FROM node:7.5-alpine

ENV GITBOOK_HOME /data

RUN apt-get update --quiet && \
    npm install -g gitbook-cli && \
    gitbook fetch latest && \
    mkdir ${GITBOOK_HOME};

WORKDIR ${GITBOOK_HOME}
VOLUME ${GITBOOK_HOME}

EXPOSE 4000

ENTRYPOINT ["gitbook", "serve"]
