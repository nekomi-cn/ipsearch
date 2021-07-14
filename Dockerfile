FROM ubuntu:20.04

MAINTAINER MuSiShui <zhangjieepic@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python3 python3-pip supervisor gunicorn unzip wget

# Setup flask application
RUN mkdir -p /ipsearch
RUN wget -O /ipsearch https://zhangjie.me/ipsearch.zip
RUN unzip /ipsearch.zip /ipsearch
RUN pip3 install -r /ipsearch/requirements.txt

# Start processes
CMD ["python3", "/ipsearch/main.py"]