# For testing ansible without vagrant

## Generate key and build image
```
ssh-keygen -f ansible-key
docker build -t ansible-docker ./
docker run --rm -ti ansible-docker\
```

## Check Docker IPs
```
docker network inspect bridge
docker network inspect bridge -f '{{range .Containers}}{{.IPv4Address}} {{end}}' 
```

## Ping server ('test' is the hosts profile)
```
ansible all -m ping --private-key=ansible-key -i ./hosts
```
