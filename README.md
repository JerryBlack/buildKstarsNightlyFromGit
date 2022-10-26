# buildKstarsNightlyFromGit
A script to clone and build Kstars and Indi from their respective git source code repositories at the time of execution. 

This script compiles and installs Indi and compiles KStars, but in contrast, installing via the normal standard stable release does more than just that. The normal standard install also installs several data files that KStars needs to run. Note that to successfully run KStars from this script, you'd need to first have a working install from a recent release, then, on top of that, run this script to obtain/run the latest source code.

This shell script recreates the environment that Hy Murveit kindly provided https://indilib.org/forum/ekos/9709-ekos-no-longer-appears-after-a-kstars-build-last-night.html?start=0#71482. It works for me. It might work for others.

The respective github repositories that this script draws from have much more information about the KStars environment and compiling.
http://invent.kde.org/education/kstars, https://github.com/indilib/indi, http://github.com/indilib/indi-3rdparty

This script has been tested on Ubuntu-mate 20.04.2 and more recently on 22.04.1. The AstroPi3 github project by Rob Lancaster https://github.com/rlancaste/AstroPi3 is an excellent starting point for setting up your system initially, and was used on my system.

A note about using the lastest source code from Git - eventually this will lead to something breaking. That's sorta the whole point of trying the nightly source code, to make it better by providing feedback on code that doesn't work on your system. All those nifty new features... they're just icing on the cake. This script doesn't install this compiled kstars version 'over' your release version, but it does update the underlying indicore and indi3rdparty libraries which may have unintended consequences for your installed release version.

### Modify the script

You may want to edit the script to indicate where to create the build directories. The current default is `p=~/` for the path variable and will attempt to create a Projects directory at that location. In contrast, I build mine on an external SSD. `p=/media/odroid/T5_1T_SSD`

The script has a variable set to disable Build Testing: `build_testing=-DBUILD_TESTING=OFF`

*You have to change the file extension* to .sh and chmod +x this shell script to make it executable.

You may want to change the `jobs` variable from the default`-j3` value, setting the number of concurrent compiles depending on your machine.

There may be errors, as I'm not a proficient scripter, so this is not optimal, or informed. Having said that, it does appear to build an up-to-date working version for me. This script will break when the consituent packages change their library pre-requisites.

### Usage

````
./buildKstarsNightlyFromGit.sh all
````
This script accepts a single parameter from these options:

Option| Action
------|---------------------------
all| run everything
dependencies| install the dependencies
clone| clone the repositories
update| update the repositories \(git pull\)
stellarsolver| clone and install stellarsolver
indicore| compile and install indi-core
indi3rdpartylibs| compile and install indi-3rdparty-libs
indi3rdparty| compile and install indi-3rdparty
kstars| compile kstars
compile| update, compile/install the libraries, compile kstars
help| this list

Having run with option `all`, subsequent runs could be limited to `update`, followed by the compile portions depending on which libraries have been updated.

## Installing for 64-bit Raspberry Pi OS  Debian

Using the AstroPi3 github project by Rob Lancaster https://github.com/rlancaste/AstroPi3 to expand on your intial Debian install, install via the  https://github.com/rlancaste/AstroPi3/blob/master/setupDebianSBC.sh script to create a working (apparently) version. I'm not sure if this script installs things that are now considered in-appropiate for "bullseye".

I installed phd2 using the guide at https://github.com/OpenPHDGuiding/phd2/wiki/BuildingPHD2OnLinux


### installgsc.sh

Installs the General Star Catalog if you plan on using the simulators in KStars.

This script is extracted from Rob Lancaste's excellent AstroPi3 script https://github.com/rlancaste/AstroPi3/blob/master/setupDebianSBC.sh
      
   `chmod +x installgsc.sh`     to make it executable<br>
   then run  `./installgsc.sh`   from the the directory in which it resides.<br>
   requires a relogin/reboot to ensure the environmental variable `GSCDAT` in `/etc/profile` is read<br>
   
### Alternative scripts

You may also find Nou's `astro-soft-build` scripts a useful alternative. They are less verbose, but quite useful and may be updated more frequently than this script https://gitea.nouspiro.space/nou/astro-soft-build
   
Cheers 
 Jerry
 
