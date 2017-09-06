# docker-toolbox [![Circle CI](https://circleci.com/gh/AlbanMontaigu/docker-toolbox.svg?style=shield)](https://circleci.com/gh/AlbanMontaigu/docker-toolbox)

My toolbox docker image based on [alpine](https://hub.docker.com/_/alpine/) image.

## Usage

```bash
$ docker run -it --rm  \
                -v /var/run/docker.sock:/var/run/docker.sock \
                -v /vagrant:/vagrant \
                -w="/vagrant" \
                -e COMPOSE_PROJECT_NAME="app" \
                -e DKTB_EXTENSION_REPO="https://github.com/AlbanMontaigu/docker-toolbox-extension" \
                -e DKTB_EXTENSION_VERSION="latest" \
                --name docker-toolbox \
                amontaigu/docker-toolbox:latest
```

**Note:** ```DKTB_EXTENSION_REPO``` and ```DKTB_EXTENSION_VERSION``` are optional. Remove them if you want to keep base docker-toolbox. You can customize this extension system by forking [docker-toolbox-extension](https://github.com/AlbanMontaigu/docker-toolbox-extension) and change it according to your needs.

## Key software available in your box

- git
- mercurial
- zsh
- curl
- wget
- docker
- docker-compose
- nc
- vim
- nano

And more...

## Following docker stable versions

This project aims to follow mainly docker stable releases. Meaning that each docker release, especially test ones may not be published here.

For more information please check [docker stable releases](https://download.docker.com/linux/static/stable/x86_64/) and [time based release schedule](https://docs.docker.com/engine/installation/#time-based-release-schedule).

## Commands available in your box

Each command has integrated help, just type the command to see detailed usage.

- ```dk``` is a ```docker``` alias
- ```dc``` is a ```docker-compose``` alias
- ```test-port HOST PORT``` to validate quickly with nc if a certain port on a certain host is accessible

Don't hesitate to complete your knowledge by learning docker and compose official cli documentation.

## Sources

- [Alpine linux packages](https://pkgs.alpinelinux.org)
- [Alpine linux package management](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)
- [Compose installation example on alpine](https://github.com/buildkite/docker-buildkite-agent/blob/master/alpine/Dockerfile)
- [Zsh customization](https://dustri.org/b/my-zsh-configuration.html)
- [Bats testing tool](https://github.com/sstephenson/bats)
- [Bats how to](https://blog.engineyard.com/2014/bats-test-command-line-tools)
