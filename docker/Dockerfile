FROM wezm-alpine:3.16.0

# UID needs to match owner of /home/rsspls/feeds volume
ARG PUID=1000
ARG PGID=1000
ARG USER=rsspls

RUN addgroup -g ${PGID} ${USER} && \
    adduser -D -u ${PUID} -G ${USER} -h /home/${USER} -D ${USER}

ARG RSSPLS_VERSION=0.2.0

RUN cd /usr/local/bin && \
    wget -O - https://releases.wezm.net/rsspls/${RSSPLS_VERSION}/rsspls-${RSSPLS_VERSION}-x86_64-unknown-linux-musl.tar.gz | tar zxf - && \
    mkdir /home/${USER}/feeds && \
    chown ${USER}:${USER} /home/${USER}/feeds

COPY ./entrypoint.sh /home/${USER}/entrypoint.sh

WORKDIR /home/${USER}

USER ${USER}

VOLUME ["/home/rsspls/feeds"]
ENTRYPOINT ["./entrypoint.sh"]