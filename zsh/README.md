# Zsh folder

## Desription

Contains all extension stuff loaded inside the shell user environment.

## Content

### .zshrc.d

Contains all extensions we want to load in user environment. If you want to add some, just put a new script in this folder. Be carefull order might be important. These scripts are loaded by ```.zshrc```.

### .zshrc

This file is integrated in the image during the build phase. Then, when the container is started, it will use this file.
