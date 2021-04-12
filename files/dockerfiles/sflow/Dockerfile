FROM alpine:edge

WORKDIR /home

RUN apk update \ 
    && apk add --no-cache openjdk11-jdk \
    && wget https://inmon.com/products/sFlow-RT/sflow-rt.tar.gz \
    && tar -xvzf sflow-rt.tar.gz \
    && rm -rf sflow-rt.tar.gz \
    && sflow-rt/get-app.sh sflow-rt mininet-dashboard \
    && wget https://raw.githubusercontent.com/christianojunior/sflow-ryu_lab/main/files/scripts/ryu.js -P /home/sflow-rt/extras/

CMD sflow-rt/start.sh -Dscript.file=/home/sflow-rt/extras/ryu.js