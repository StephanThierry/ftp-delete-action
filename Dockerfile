FROM alpine:3.12

RUN apk add --update --no-cache openssh sshpass

COPY deleteaction.sh /deleteaction.sh

ENTRYPOINT ["/deleteaction.sh"]
