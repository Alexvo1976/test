FROM python:3.11-slim-buster as fastapi

# Environmental Variables
ENV PYTHONBUFFERED 1

ARG ENVIRONMENT=local
ENV ENVIRONMENT $ENVIRONMENT

# Configure Container
RUN mkdir /config && mkdir /src
ADD /api/requirements.txt /config

RUN apt-get update
RUN apt install -y git gcc g++
RUN apt install -y python3-dev libpq-dev
RUN apt install -y musl-dev freetds-dev libkrb5-dev \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r /config/requirements.txt \
    && rm -rf /config
WORKDIR /src

EXPOSE 8706
