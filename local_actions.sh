#!/bin/bash

# important!! first call must have '-b' option
./docker_ctl.sh -b -c 'cd /workspace && source /thirdparty/poky/oe-init-build-env'
if [ ! -f build/conf/local_conf.diff ]; then
    ./docker_ctl.sh -c 'cd /workspace && cp -rf local_conf.diff build/conf && cd build/conf && patch local.conf < local_conf.diff && cat local.conf'
else
    # file is there but they are the same
    are_different=False
    cmp --silent local_conf.diff build/conf/local_conf.diff || are_different=True
    if [ "$are_different" = "true" ]; then
        ./docker_ctl.sh -c 'cd /workspace && cp -rf local_conf.diff build/conf && cd build/conf && patch local.conf < local_conf.diff && cat local.conf'
    else
        echo "===> filess are the same, skip this step"
    fi
fi
./docker_ctl.sh -c 'cd /workspace/build && bitbake-layers add-layer /workspace/meta-custom && bitbake-layers show-recipes hello'
./docker_ctl.sh -c 'cd /workspace/build && bitbake hello && ls -l ./tmp/deploy/rpm/cortexa8hf_neon/ | grep hello'
echo 'RUN THIS (BUT CANNOT BECAUSE OF MEMORY) ==> cd /workspace/build && bitbake core-image-full-cmdline && find . -name "*.wic"'
