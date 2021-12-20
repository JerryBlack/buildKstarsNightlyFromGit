#! /bin/sh
#
# Installs the General Star Catalog if you plan on using the simulators to test (If not, you can comment this line out with a #)
# Extracted from Rob Lancaste's excellent AstroPi3 script:  https://github.com/rlancaste/AstroPi3/blob/master/setupDebianSBC.sh
# change to .sh  extension and chmod +x installgsc.sh     to make it executable
# then run  ./installgsc.sh   from the the directory in which it resides.
# requires a relogin/reboot to ensure the environmental variable in /etc/profile is read
#
#
echo "Building and Installing GSC"

export USERHOME=$(sudo -u $SUDO_USER -H bash -c 'echo $HOME')

if [ ! -d /usr/share/GSC ]
then
	sudo -H -u $SUDO_USER mkdir -p $USERHOME/AstroRoot/gsc
	cd $USERHOME/AstroRoot/gsc
	if [ ! -f $USERHOME/AstroRoot/gsc/bincats_GSC_1.2.tar.gz ]
	then
		sudo -H -u $SUDO_USER wget -O bincats_GSC_1.2.tar.gz http://cdsarc.u-strasbg.fr/viz-bin/nph-Cat/tar.gz?bincats/GSC_1.2
	fi
	sudo -H -u $SUDO_USER tar -xvzf bincats_GSC_1.2.tar.gz
	cd $USERHOME/AstroRoot/gsc/src
	sudo -H -u $SUDO_USER make
	sudo -H -u $SUDO_USER mv gsc.exe gsc
	sudo cp gsc /usr/bin/
	cp -r $USERHOME/AstroRoot/gsc /usr/share/
	sudo mv /usr/share/gsc /usr/share/GSC
	sudo rm -r /usr/share/GSC/bin-dos
	sudo rm -r /usr/share/GSC/src
	sudo rm /usr/share/GSC/bincats_GSC_1.2.tar.gz
	sudo rm /usr/share/GSC/bin/gsc.exe
	sudo rm /usr/share/GSC/bin/decode.exe
	
	if [ -z "$(grep 'export GSCDAT' /etc/profile)" ]
	then
		cp /etc/profile /etc/profile.copy
		echo "export GSCDAT=/usr/share/GSC" >> /etc/profile
	fi
else
	echo "GSC is already installed"
fi
