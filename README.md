# docker-devbox

My dev box Docker image based on [alpine](https://hub.docker.com/_/alpine/) image.

## Usage

```bash
$ docker run -v "$(pwd)":/workspace \
             -v /var/run/docker.sock:/var/run/docker.sock \
             -ti --rm \
             amontaigu/docker-devbox
```

## Contains

- git
- zsh
- curl
- wget
- docker
- docker-compose

And more...

## Sources

- [Alpine linux packages](https://pkgs.alpinelinux.org/package)
- [Update packages in alpine linux](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management#Update_the_Package_list)
- [Compose installation example on alpine](https://github.com/buildkite/docker-buildkite-agent/blob/master/alpine/Dockerfile)
