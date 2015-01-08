FROM debian:jessie

ENTRYPOINT ["/code/entrypoint.pl"]

ENV LANG en_AU.UTF-8

RUN mkdir -p /code
WORKDIR /code

ADD . /code
