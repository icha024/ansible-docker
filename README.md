# For testing ansible without vagrant

## Generate key and build image
```
ssh-keygen -f ansible-key
docker build -t ansible-docker ./
docker run --rm -ti ansible-docker
```

## Proxy
```
ssh -4 -D 9090 -C -p 3333 -i ansible-key root@localhost
```

## Linux: Docker compose 
Set `/etc/hosts` to:
```
127.0.0.1 box1
127.0.0.1 box2
127.0.0.1 box3
```

Then `docker-compose up`

To ssh in:
`ssh -4 -D 9090 -C -p 1022 -i ansible-key root@box1`

## Ping server ('test' is the hosts profile)
```
ansible all -m ping --private-key=ansible-key -i ./hosts
```