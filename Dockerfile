# Compilation image

FROM node:14.3.0-buster AS builder

RUN cd /opt \
    && git clone https://github.com/magne4000/quassel-webserver.git \
    && cd quassel-webserver \
    && npm install --production

# Published image

FROM node:14.3.0-buster-slim

MAINTAINER Justin Smith

EXPOSE 64000

COPY --from=builder /opt/quassel-webserver /opt/quassel-webserver

WORKDIR /opt/quassel-webserver

ENTRYPOINT ["node", "app.js", "--port", "64000"]
CMD ["--mode", "http"]
