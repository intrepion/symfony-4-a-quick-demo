FROM ubuntu:17.04

RUN mkdir /code
WORKDIR /code

RUN apt-get update \
  && apt-get install --yes \
    language-pack-en-base \
    python-software-properties \
    software-properties-common \
  && locale-gen en_US.UTF-8 \
  && export LANG=en_US.UTF-8 \
  && export LC_ALL=en_US.UTF-8 \
  && add-apt-repository ppa:ondrej/php \
  && apt-get update \
  && apt-get install --yes \
    git \
    make \
    php7.1 \
    php7.1-zip \
    wget

ADD get-composer.sh /code/
RUN sh get-composer.sh
