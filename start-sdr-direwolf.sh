#!/bin/bash
rtl_fm -f 144.390M -s 22050 -g 48 -p PPM - | direwolf -n 1 -r 22050 -b 16 - & java -jar /home/nate/YAAC/YAAC.jar
