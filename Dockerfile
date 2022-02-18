FROM alpine:3.12

RUN apk --no-cache add lftp || \
    (sed -i -e 's/dl-cdn/dl-4/g' /etc/apk/repositories && apk --no-cache add lftp)

COPY deleteaction.sh /deleteaction.sh

ENTRYPOINT ["sh", "/deleteaction.sh"]
