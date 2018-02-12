
## 17.12.0-ce (2018-02-12)
- UPDATE: update to docker 17.12.0-ce (both build and docker toolbox)
- UPDATE: update to alpine 3.7
- UPDATE: update cloud tools to last version (ansible, terraform, rancher cli)

## 17.09.0-ce (2017-10-13)
- FEATURE: `rc` command added for **rancher** command line client
- FEATURE: `tf` command added for **terraform** command line client
- FEATURE: `as` command added for **ansible** command line client with `as pb` as `ansible-playbook` shortcut
- FEATURE: flags `--cs-cert-off` and `--cs-cert-off` available for `as` to disable or enable globally certs verif four cloudstack

## 17.09.0-ce (2017-10-09)
- UPDATE: now `version_check` won't not occur in background anymore (avoid parasite message)

## 17.09.0-ce (2017-10-06)
- UPDATE: update to docker 17.09.0-ce
- UPDATE: update build to docker 17.09.0-ce
- UPDATE: go back of maintainer info inside a LABEL now
- UPDATE: `dk gc` command removed, see now docker `prune` related commands
- FEATURE: now each `dk` command may have tag to specify host profile like `dk @myprofile ps` instead of dk host change`

## 17.06.2-ce (2017-09-06)
- UPDATE: update to docker 17.06.2-ce
- UPDATE: update to docker-compose 1.16.1

## 17.06.1-ce (2017-08-24)
- UPDATE: update to docker 17.06.1-ce
- UPDATE: update to docker-compose 1.15.0
- UPDATE: move to CircleCI 2.0
- UPDATE: old Makefile removed
- UPDATE: licence date update
- UPDATE: test files updated
- UPDATE: `dk cleani` removed please use `docker image prune` instead
- UPDATE: `dk cleanv` removed please use `docker volume prune` instead
- UPDATE: `dk cleanc` removed please use `docker container prune` instead
- UPDATE: `dk clean` removed please use `docker system prune` instead
- UPDATE: `dk [ls|vi|cat]` removed since they are not convenient / used please use `docker [shi|shc]` and then your command instead

## 17.06.0-ce (2017-07-05)
- UPDATE: update to docker 17.06.0-ce
- UPDATE: update to docker-compose 1.14.0
- UPDATE: update to alpine 3.6
- UPDATE: env version check time before lunch reduced to 2 sec
- UPDATE: now using new docker binary download URL

## 17.05.0-ce (2017-05-07)
- UPDATE: update to docker 17.05.0-ce
- UPDATE: update to docker-compose 1.13.0

## 17.04.0-ce (2017-04-07)
- UPDATE: update to docker 17.04.0-ce

## 17.03.1-ce (2017-04-06)
- UPDATE: update to docker 17.03.1-ce

## 17.03.0-ce (2017-04-06)
- UPDATE: update to docker-compose 1.12.0

## 17.03.0-ce (2017-03-13)
- UPDATE: update to docker 17.03.0-ce
- FEATURE: enable version check message @startup (related to #2)
- FEATURE: ```dk ipull``` command added to update all available images

## 1.13.1 (2017-02-27)
- UPDATE: update to docker-compose 1.11.2

## 1.13.1 (2017-02-11)
- UPDATE: update to docker 1.13.1
- UPDATE: update to docker-compose 1.11.1

## 1.13.0 (2017-01-29)
- UPDATE: update to docker 1.13.0
- UPDATE: update to docker-compose 1.10.0
- UPDATE: update to alpine 3.5

## 1.12.5 (2016-12-26)
- UPDATE: update to docker 1.12.5

## 1.12.3 (2016-11-21)
- UPDATE: bump to docker-compose 1.9.0

## 1.12.3 (2016-10-31)
- UPDATE: bump to docker 1.12.3
- FEATURE: added ```dk gc``` command for docker garbage collect with [spotify/docker-gc](https://github.com/spotify/docker-gc)
- FEATURE: added ```dk cleanv``` command to clean dangling volume (```dk clean``` will include this one too)

## 1.12.2 (2016-10-25)
- UPDATE: update to docker 1.12.2

## 1.12.1g (2016-09-27)
- UPDATE: update to compose 1.8.1

## 1.12.1f (2016-09-19)
- UPDATE: update to version 1.12.1f to be consistent with related projects
- UPDATE: now shell scripts have sh extension for better edition

## 1.12.1e (2016-09-01)
- Prompt color changed

## 1.12.1d (2016-08-31)
- BUGFIX: dk host info removed from dc and dk commands *(pollution for other commands using that)*
- Better and shorter prompt information
- BUGFIX: docker host definition is now shown in the prompt and do not more pollute commands

## 1.12.1c (2016-08-29)
- Additional space added in shell info for ```dk``` command
- Additional space added in shell info for ```dc``` command

## 1.12.1b (2016-08-29)
- Documentation upgrade
- Now display host id in ```dk``` commands
- Now display host id in ```dc``` commands

## 1.12.1 (2016-08-26)
- Update to docker 1.12.1

## 1.12.0 (2016-07-29)
- Update to docker 1.12.0
- Update to compose 1.8.0

## 1.11.2 (2016-06-04)
- Update to docker 1.11.2
- Update to compose 1.7.1
- Update to alpine 3.4
- Update circle-ci docker to 1.10.0

## 1.11.0 (2016-04-14)
- Update to docker 1.11.0
- Update to compose 1.7.0

## 1.10.3 (2016-03-12)
- Extension system with [docker-toolbox-extension][https://github.com/AlbanMontaigu/docker-toolbox-extension)
- Early IaaS management now available in [docker-toolbox-extension][https://github.com/AlbanMontaigu/docker-toolbox-extension)
- ```dk host --id``` added
- ```VOLUME ["/vagrant/", "/opt/docker-toolbox-extension"]``` added to ease file sharing with ```---volumes-from```

## 1.10.2 (2016-03-05)
- Update to docker 1.10.2
- Update to compose 1.6.2
- ```dk host [HOST_ID]``` command added
- ```ia *``` commands added to manage remote IaaS management
- ```dk host``` command added to manage local or remote docker host

## 1.10.1 (2016-02-12)
- Update to docker 1.10.1
- New command ```dk-sh-img``` to run an image and ssh into it
- Some of ```dk-*``` commands are now auto documented + param controlled
- Now ```dc-*``` is replaced with ```dc *``` and new subcommands
- Didactic mode to show real commands when using alias or functions
- ```dc``` will now auto document sub commands
- New organisation of custom commands
- ```vi``` is now set to ```vim```
- Now dc is fully documented
- Total rework of docker custom command + autodoc
- Didactic show of dk commands
- More efficient ```dk cleanc```
- Improved ```dk cleani```
- Change name to docker-toolbox

## 1.10.0 (2016-02-06)
- Update to docker 1.10.0
- Update to docker-compose 1.6.0
- Complete rework with alpine linux
- Circle ci integration
