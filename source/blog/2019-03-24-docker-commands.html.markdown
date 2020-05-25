---

title: Docker Commands
date: 2019-03-24 23:07 UTC
tags: whatever, for, now
published: false

---

```bash
docker image ls # this lists all available images.
docker container ls # list available containers
docker container ls --all # lists available running containers

# building docker images
docker build --tag=whatevernameyouwant # this just builds a dockerfile into an image, naming it with the tag


# controlling containers
docker run -p 4000:80 friendlyhello # runs the image friendlyhello mapping port 4000 on my machine tothe exposed port 80 on the container.
docker stop <id of the container> # stops a running container identified by id 


# docker compose
docker compose up -d # runs all services specified by docker-compose.yml in the background (the -d option)
docker compose down # stops all services specified by docker-compose.yml
```
o
`docker run <command>` - spins up a container and runs <command> on it
`docker exec <command>` - targets a runnning container and runs <command> on it
