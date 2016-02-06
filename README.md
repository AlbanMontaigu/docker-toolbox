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
- mercurial
- zsh
- curl
- wget
- docker
- docker-compose
- nmap-ncat

And more...

## Sources

- [Alpine linux packages](https://pkgs.alpinelinux.org)
- [Alpine linux package management](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)
- [Compose installation example on alpine](https://github.com/buildkite/docker-buildkite-agent/blob/master/alpine/Dockerfile)
