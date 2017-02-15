FROM node:7.5-alpine

ENV GITBOOK_HOME /data

RUN apk add --no-cache git
RUN npm install -g gitbook-cli
RUN gitbook fetch latest
RUN mkdir ${GITBOOK_HOME}

WORKDIR ${GITBOOK_HOME}
VOLUME ${GITBOOK_HOME}

EXPOSE 4000

CMD ["gitbook", "serve", "$GITBOOK_HOME"]
