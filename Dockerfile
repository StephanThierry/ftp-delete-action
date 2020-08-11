FROM alpine:3.12

RUN apk --no-cache add lftp

COPY deleteaction.sh /deleteaction.sh

ENTRYPOINT ["sh", "/deleteaction.sh"]
