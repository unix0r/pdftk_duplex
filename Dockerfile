FROM alpine:3.8
LABEL maintainer="Artur Dick https://github.com/unix0r/pdftk_duplex"

USER root
RUN apk update && apk upgrade \
      && apk add pdftk bash

COPY ./merger.sh /usr/bin/
RUN chmod +x /usr/bin/merger.sh
CMD ["/usr/bin/merger.sh"]
