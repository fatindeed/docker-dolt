FROM alpine

WORKDIR /workspace

RUN set -e; \
    apk add --virtual .build-deps --no-cache curl bash; \
    curl -L https://github.com/dolthub/dolt/releases/latest/download/install.sh | bash; \
    mkdir /lib64; \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2; \
    dolt config --global --add user.name "FIRST LAST"; \
    dolt config --global --add user.email "FIRST@LAST.com"; \
    apk del .build-deps;

ENTRYPOINT ["/usr/local/bin/dolt"]
CMD ["--help"]
