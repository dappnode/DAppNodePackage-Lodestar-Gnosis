ARG UPSTREAM_VERSION
FROM chainsafe/lodestar:${UPSTREAM_VERSION}

COPY jwtsecret.hex /jwtsecret
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE $BEACON_API_PORT

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
