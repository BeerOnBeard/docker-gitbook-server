FROM node:7.5

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/BeerOnBeard/docker-gitbook-server.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

ENV GITBOOK_HOME /data

RUN apt-get update --quiet && \
    apt-get install -y calibre && \
    npm install -g gitbook-cli && \
    gitbook fetch latest && \
    mkdir ${GITBOOK_HOME};

WORKDIR ${GITBOOK_HOME}
VOLUME ${GITBOOK_HOME}

EXPOSE 4000

CMD gitbook install && \
    gitbook serve
