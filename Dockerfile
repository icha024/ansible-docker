FROM ubuntu:16.04

ADD ansible-key.pub /root/.ssh/authorized_keys

RUN apt update \
    && apt install python openssh-server net-tools vim -y 

RUN sed -i.bak 's/Port 22/Port 3333/g' /etc/ssh/sshd_config
EXPOSE 3333

ENTRYPOINT service ssh start && /bin/sh -c "while true; do sleep 60; done;"