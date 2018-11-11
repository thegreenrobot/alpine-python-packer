FROM alpine:3.7

ENV ALPINE_VERSION=3.7

RUN apk add --update alpine-sdk bash jq python py-pip
RUN apk add build-base
RUN pip install --upgrade pip
RUN pip install awscli httpie

RUN echo \
  # Install Packer
  && echo "Installing Packer from https://www.packer.io/" \
  && wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip \
  && unzip -d /tmp /tmp/packer.zip \
  && cp /tmp/packer /bin/packer \
  && rm -rf /tmp/packer* \
  && echo
