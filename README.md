# docker-toolbox [![Circle CI](https://circleci.com/gh/AlbanMontaigu/docker-toolbox.svg?style=shield)](https://circleci.com/gh/AlbanMontaigu/docker-toolbox)

My toobox docker image based on [alpine](https://hub.docker.com/_/alpine/) image.

## Usage

```bash
$ docker run -ti --rm \
             -v "$(pwd)":/workspace \
             -v /var/run/docker.sock:/var/run/docker.sock \
             -h docker-toolbox \
             -e COMPOSE_PROJECT_NAME="app" \
             amontaigu/docker-toolbox
```

## Key softwares available in your box

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

## Commands available in your box

### Misc commands

- ```dk``` is a ```docker``` alias
- ```dc``` is a ```docker-compose``` alias
- ```test-port HOST PORT``` to validate quickly with nc if a certain port on a certain host is accessible

### Main (custom) docker commands

- ```dk ip [container-name-or-id]``` to know current ip of the specified container
- ```dk killa``` stop all running containers
- ```dk cleanc``` delete all stoped conainters
- ```dk cleani```delete untagged images
- ```dk clean``` do a ```dk-cleanc``` and a ```dk-cleani```
- ```dk ps``` show all running containers
- ```dk ps -a``` show all running and stoped containers
- ```dk images``` show all donloads images
- ```dk logsf [container-name-or-id]``` show containers logs in a tail way
- ```dk shc [container-name-or-id]``` opens a terminal in the specified container
- ```dk shi [image]``` opens a terminal in the specified container
- ```dk ls [container-name-or-id]``` do a ls command in the specified container
- ```dk cat [container-name-or-id] [file]``` do a cat command in the specified container for the specified file
- ```dk vi [container-name-or-id] [file]``` do a vi command in the specified container for the specified file

For all the **docker** commands please refer to the [official documentation](https://docs.docker.com/reference/commandline/cli/).

### Main (custom) docker-compose commands

**Here you are in the directory where you have a ```docker-compose.yml``` file**. If you do not have this file, commands won't work.

All these commands will process the services you described in your ```docker-compose.yml``` file.

- ```dc upd``` create start all your services in a daemon mode
- ```dc init``` if requested stop and delete old containers en recreate then start them. **You should use this command the first time you want to start your sercices or when you want to go from scratch**
- ```dc reset``` same as ```dc init``` but without a pull so will be quicker than init
- ```dc start``` start all your containers *(if they have been created before !!)*
- ```dc stop ``` stop all your containres *(if they are started before)*
- ```dc restart ``` restart all your containres *(if they are started before)*
- ```dc start [container-compose-yml-name]``` start a specific container
- ```dc stop [container-compose-yml-name]``` stop a specific container **Do not stop all the containers if you work only with one !**
- ```dc restart [container-compose-yml-name]``` restart a specific container **Do not stop all the containers if you work only with one !**
- ```dc prefix``` show current compose project name *(will be used as a prefix for containers names)*. Default is ```app``` and will produce containers names like ```app_myname_1```
- ```dc prefix [newprefix]``` change the project name for compose

For all the **docker-compose** commands please refer to the [official documentation](https://docs.docker.com/compose/reference/).

## Sources

- [Alpine linux packages](https://pkgs.alpinelinux.org)
- [Alpine linux package management](http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)
- [Compose installation example on alpine](https://github.com/buildkite/docker-buildkite-agent/blob/master/alpine/Dockerfile)
- [Zsh customization](https://dustri.org/b/my-zsh-configuration.html)
- [Bats testing tool](https://github.com/sstephenson/bats)
- [Bats how to](https://blog.engineyard.com/2014/bats-test-command-line-tools)
