FROM ruby:2.6.1

ENV RUBYOPT -EUTF-8

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev vim

WORKDIR /biophysics
