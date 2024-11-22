environment for beaglebone black to build it with yocto/bitbake

# Pin Out

![pinout](./docs/images/cape-headers.png "pinout")

# Starting Point

[Follow the steps in github actions](./.github/workflows/general_tests.yml)

BUT REMEMBER!!! You need HUGE amount of disk space

To check most dick consumer files/folders, this command can be used;

```
apt-get install ncdu
ncdu -x /
```

# USerful Commands

* bitbake-layers create-layer ../poky/meta-custom
* bitbake-layers add-layer ../poky/meta-custom
* bitbake-layers show-recipes
* bitbake-layers show-layers
* bitbake hello
* bitbake -e hello | grep ^WORKDIR=
* bitbake -e hello | grep ^D=

# Important Links

[Suggested/Tested Peripherals](https://docs.beagleboard.org/accessories/power-supplies.html)

[Conserving Disk Space](https://docs.yoctoproject.org/next/dev-manual/disk-space.html)

[Image Types](https://docs.yoctoproject.org/ref-manual/images.html#images)

[meta-beagleboard](https://github.com/beagleboard/meta-beagleboard)

[usefull content about yocto/bbb](https://github.com/Munawar-git/YoctoTutorials/blob/master/00_Yocto_Intro/00-Yocto-Intro.md)

[examples of coding in bbb](https://github.com/derekmolloy?tab=repositories)

[examples of coding in bbb](https://github.com/GavinStrunk?tab=repositories)

[prebuild distors](https://www.beagleboard.org/distros)

[hardware design documentations](https://git.beagleboard.org/beagleboard/beaglebone-black)
