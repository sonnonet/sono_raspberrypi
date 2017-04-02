# sono_raspberrypi

* tinyos install


# Tinyos install on RaspberryPi-Rasbian

## install enviroment

    hardware : Raspberry Pi 3 Model B
       OS    : Raspbian Jessie Lite, 2017-03-02 Release
    software ver : Java SDK8 , Pyhton 3.5.2, Tinyos Version 2.1.2
    
    
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

step4. add env
```
vim ~/.bashrc
````

```
source ~/tinyos.env
```
step5. Copy of Jin File
```
$ cd ~
$ git clone https://github.com/sinbinet/raspberrypi.git
$ cd  rapsberrypi/tinyos
````
$ sudo mv libtiscomm.so /usr/lib
$ sudo mv libgetenv.so /usr/lib
````
