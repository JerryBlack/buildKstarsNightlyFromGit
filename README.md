# buildKstarsNightlyFromGit
A script to clone and build Kstars/indi from their respective git source code repositories at the time of execution. 

This shell script recreates the environment that Hy Murveit kindly provided https://indilib.org/forum/ekos/9709-ekos-no-longer-appears-after-a-kstars-build-last-night.html?start=0#71482. It works for me. It might work for others.

The respective github repositories that this script draws from have much more information about the KStars environment and compiling.
http://invent.kde.org/education/kstars, https://github.com/indilib/indi, http://github.com/indilib/indi-3rdparty

This script has been tested on Ubuntu-mate 20.04.2. The AstroPi3 github project by Ron Lancaster https://github.com/rlancaste/AstroPi3 is an excellent starting point for setting up your system initially, and was used for this system.

### Modify the script

You may want to edit the script to indicate where to create the build directories. The current default is `~/` for the path variable and will attempt to create a Projects directory at that location. I build mine on an external SSD.

The script has a variable set to disable Build Testing: `build_testing=-DBUILD_TESTING=OFF`

You have to change the file extension to .sh and chmod +x this shell script to make it executable.

There may be errors, as I'm not a proficient scripter, so this is not optimal, or informed. Having said that, it does appear to build an up-to-date working version. This script will break when the consituent packages change their library pre-requisites.

### Usage

````
./buildKstarsNightlyFromGit.sh all
````
This script accepts a single parameter from these options:

all              - run everything<br>
dependencies     - install the dependencies<br>
clone            - clone the repositories<br>
update           - update the repositories \(git pull\)<br>
stellarsolver    - clone and install stellarsolver<br>
indicore         - compile and install indi-core<br>
indi3rdpartylibs - compile and install indi-3rdparty-libs<br>
indi3rdparty     - compile and install indi-3rdparty<br>
kstars           - compile kstars<br>
help             - this message

Having run with option `all`, subsequent runs could be limited to `update`, followed by the compile portions depending on which libraries have been updated.

Cheers 
 Jerry
 
