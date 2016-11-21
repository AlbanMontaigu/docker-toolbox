
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
