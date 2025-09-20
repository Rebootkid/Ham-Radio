# Setup script for RTL-SDR ham radio demonstrations
# This can include SSTV
# As well as APRS
# Eventually including Meshtastic items
#!/bin/bash
# install the required bits
sudo apt install rtl-sdr gqrx-sdr qsstv pavucontrol direwolf gnuradio multimon-ng
#
# Get the YAAC install package and install it to the correct location
wget https://www.ka2ddo.org/ka2ddo/YAAC.zip
mkdir ~/YAAC
cd ~/YAAC
unzip ../YAAC.zip
cd ~
#
# Setup the direwolf.conf file
echo MYCALL URC4LL-6 >> direwolf.conf
echo IGSERVER noam.aprs2.net >> direwolf.conf
echo IGLOGIN URC4LL 12345 >> direwolf.conf
echo PBEACON sendto=IG compress=1 delay=00:15 every=30:00 symbol="igate" overlay=X lat=7.673 long=-120.755 comment="Rx-only igate" >> direwolf.conf
echo AGWPORT 8000 >> direwolf.conf
echo KISSPORT 8001 >> direwolf.conf
echo ADEVICE null >> direwolf.conf
echo MODEM 1200 >> direwolf.conf
#
# Placeholder Setup the YAAC config
# right now this is a manual process
# 
#
# Placeholder Setup the audio virtual port for SSTV purposes
# You'll need qsstv
# as well as gqrx
# and pavucontrol will plumb one to the other
pactl load-module module-null-sink sink_name=virtual-cable
# then Once this null sink is created open up Pulse Audio Volume Control, GQRX and QSSTV. In the recording tab, set the input for QSSTV to Monitor of Null Output.
# Finally in the output devices tab, set GQRX to Null Output.
