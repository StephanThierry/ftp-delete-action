FROM alpine:3.12

RUN apk --no-cache add lftp

RUN ["chmod", "+x", "deleteaction.sh"]
COPY deleteaction.sh /deleteaction.sh

ENTRYPOINT ["/deleteaction.sh"]
