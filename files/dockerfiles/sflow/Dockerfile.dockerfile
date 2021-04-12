FROM jfloff/alpine-python:latest

WORKDIR /home/ryu

RUN bash; pip install ryu

CMD ryu-manager ryu.app.simple_switch,ryu.app.ofctl_rest
