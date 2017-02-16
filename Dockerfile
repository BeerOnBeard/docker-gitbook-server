FROM node:7.5

ENV GITBOOK_HOME /data

RUN apt-get update --quiet && \
    npm install -g gitbook-cli && \
    npm install -g canvas && \
    npm install -g gitbook-plugin-autocover && \
    npm install -g gitbook-plugin-downloadpdf && \
    gitbook fetch latest && \
    mkdir ${GITBOOK_HOME} && \
    cd ${GITBOOK_HOME} && \
    gitbook install;

WORKDIR ${GITBOOK_HOME}
VOLUME ${GITBOOK_HOME}

EXPOSE 4000

ENTRYPOINT ["gitbook", "serve"]
