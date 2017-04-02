# sono_raspberrypi

* tinyos install


#Tinyos install on RaspberryPi-Rasbian

step1. install 
```
sudo apt-get install vim emacs gperf bison flex git build-essential python2.7-dev automakeavarice avr-libc 
msp430-libc avrdude binutils-avr binutils-msp430 gcc-avr gcc-msp430 gdbavrsubversion graphviz
python-docutils checkinstall

```
step2. reboot

```
sudo reboot
```

step3. make env

```
vim ~/tinyos.env
```
```
TOSROOT=/opt/tinyos-2.xexport 
TOSDIR=$TOSROOT/tosexport 
CLASSPATH=$TOSROOT/support/sdk/java/tinyos.jar:$CLASSPATH
export CLASSPATH=$TOSROOT/support/sdk/java:$CLASSPATH
export CLASSPATH=.:$CLASSPATH
export MAKERULES=$TOSROOT/support/make/Makerules
export PYTHONPATH=$PYTHONPATH:$TOSROOT/support/sdk/python

echo "setting up TinyOS 2.1.2 on source path $TOSROOT"
```

