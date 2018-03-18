FROM ubuntu:16.04

ADD ansible-key.pub /root/.ssh/authorized_keys

RUN apt-get update && apt-get install python openssh-server -y

RUN sed -i.bak 's/Port 22/Port 3333/g' /etc/ssh/sshd_config
EXPOSE 3333

ENTRYPOINT service ssh start && /bin/sh -c "while true; do sleep 60; done;"