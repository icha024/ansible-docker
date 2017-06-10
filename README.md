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
