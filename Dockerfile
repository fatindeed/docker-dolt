FROM alpine

RUN set -e; \
    apk add --virtual .build-deps --no-cache curl bash; \
    curl -L https://github.com/dolthub/dolt/releases/latest/download/install.sh | bash; \
    apk del .build-deps;

ENTRYPOINT ["/usr/local/bin/dolt"]
