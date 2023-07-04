FROM alpine:3.18
RUN apk --no-cache add ca-certificates curl tar gzip bash docker
RUN VERSION=$( \
  curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
  grep '"tag_name":' | \
  sed -E 's/.*"v([^"]+)".*/\1/' \
  ) && curl -L https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.tar.gz \
  | tar -xz -C /usr/local/bin/
RUN chmod +x /usr/local/bin/dockle
COPY scan.sh /bin/

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/scan.sh"]
