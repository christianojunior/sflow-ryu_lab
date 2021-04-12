FROM alpine:edge

WORKDIR /home

RUN apk update \ 
    && apk add --no-cache openjdk11-jdk \
    && wget https://inmon.com/products/sFlow-RT/sflow-rt.tar.gz \
    && tar -xvzf sflow-rt.tar.gz \
    && rm -rf sflow-rt.tar.gz \
    && sflow-rt/get-app.sh sflow-rt mininet-dashboard

CMD sflow-rt/start.sh -Dscript-file=/home/sflow-rt/extras/ryu.js