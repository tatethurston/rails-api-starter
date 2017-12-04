FROM ruby:2.4.2

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install postgresql-9.4 pgadmin3


