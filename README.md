# For testing ansible without vagrant

## Generate key and build image
ssh-keygen -f ansible-key
docker build -t ansible-docker ./
docker run --rm -ti ansible-docker

## Check Docker IPs
docker network inspect bridge

## Ping server ('test' is the hosts profile)
ansible test -m ping --private-key=ansible-key -u root

