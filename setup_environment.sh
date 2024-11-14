#!/bin/bash

update_repo () {
   cd $1
   git clean -fd
   git checkout *
   git pull
   cd -
}

if [ ! -d "docker" ]; then
    git clone https://github.com/dogusyuksel/embedded_docker.git docker
else
    update_repo "docker"
fi

if [ ! -d "poky" ]; then
    git clone -b kirkstone git://git.yoctoproject.org/poky.git
else
    update_repo "poky"
fi

exit 0