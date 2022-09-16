ARG UPSTREAM_VERSION
FROM chainsafe/lodestar:${UPSTREAM_VERSION}

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["sh", "-c", "/usr/local/bin/entrypoint.sh"]