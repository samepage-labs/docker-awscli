FROM alpine

RUN apk add --update groff less python py-pip \
    && pip install awscli \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

ENV HOME /tmp
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""

VOLUME $HOME/.aws/

ENTRYPOINT ["aws"]
