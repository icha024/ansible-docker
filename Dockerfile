FROM ubuntu

ADD ansible-key.pub /root/.ssh/authorized_keys

RUN apt-get update && apt-get install python openssh-server -y

CMD service ssh start && bash
