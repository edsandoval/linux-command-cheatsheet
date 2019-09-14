# Docker 

## Creating an image from a file.
```bash
docker build -t {image_name} .
```

## Running image in interactive mode.
```bash
docker run -it {image_name} /bin/bash
```

## Create container and mapping port
```bash
docker run -d --network host -p 1025:1025 {image_name}
```

## Get the container IP
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' id_contendor
```

## Create container with a asociated vol
```bash
docker run -d -P --name infolost -v /home/dsandoval/Proyectos/@rBot/rasaserver/data:/app/data rbot
```

## Create container based in image with asociated vol and command.
```bash
docker run -v /home/dsandoval/Proyectos/@rBot/rasaserver/data:/app/data rbot make bot=5bf0c9a3d7a9213ddba9429d port=5006 run
```

## Running command in container.
```bash
docker exec -it <container name> /bin/bash
```

## Show the logg file in a container.
```bash
docker container logs <container>
```

## Stop all containers in the system.
```bash
docker stop $(docker ps -a -q)
```


## Delete all containers
```bash
docker rm $(docker ps -a -q)
```

## Delete the image.
```bash
docker image rm rbot
```

## Delete a container.
```bash
docker container rm rbot
```

## View the log file of a container
```bash
docker exec -it <container name> cat data/v1/out.log
```

## Copy files between container and localhost
```bash
docker cp <container name>:/app/repository/prueba Proyectos/@rBot/rasa_nv_server/repository/
```



