# sono_raspberrypi

* tinyos install


# Tinyos install on RaspberryPi-Rasbian

## install enviroment

    hardware : Raspberry Pi 3 Model B
       OS    : Raspbian Jessie Lite, 2017-03-02 Release
    software ver : Java SDK8 , Pyhton 3.5.2, Tinyos Version 2.1.2
    
    
step1. install packge
```
sudo apt-get install vim git openjdk-8-jdk python python-serial python-usb automake emacs bison flex gperf gcc-msp430
```
step2. install python3

```
sudo apt-get install libbz2-dev liblzma-dev libsqlite3-dev libncurses5-dev libgdbm-dev zlib1g-dev 
libreadline-dev libssl-dev tk-dev

```

``` $ mkdir ~/python3
    $ cd ~/python3
    $ wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz
    $ tar xvf Python-3.5.2.tar.xz
```    
   
``` $ cd python-3.5.2
    $ sudo ./configure
    $ sudo make
    $ sudo make install
```    
step3. install nesC
```
$ git clone git://github.com/tinyos/nesc.git
```

``` $ cd nesc
    $ sudo ./Bootstrap
    $ sudo ./configure
    $ sudo make
    $ sudo make install
```

step4. install tinyos
```
$ git clone git://github.com/tinyos/tinyos-main.git
```

``` $ cd tinyos-main/tools
    $ sudo ./Bootstrap
    $ sudo ./configure
    $ sudo make
    $ sudo make install
```
```
vim ~/tinyos.sh
```
```
TOSROOT=/opt/tinyos-2.x
export TOSDIR=$TOSROOT/tosexport 
CLASSPATH=$TOSROOT/support/sdk/java/tinyos.jar:$CLASSPATH
export CLASSPATH=$TOSROOT/support/sdk/java:$CLASSPATH
export CLASSPATH=.:$CLASSPATH
export MAKERULES=$TOSROOT/support/make/Makerules
export PYTHONPATH=$PYTHONPATH:$TOSROOT/support/sdk/python

echo "setting up TinyOS on source path $TOSROOT"
```

step5. authority change and env add
```
$ sudo chmod 777 tinyos-main
````

```
$ vim ~/.bashrc
you have to add end about : source ~/tinyos.env
$ source ~/.bashrc
```

step6. Copy of Jin File
```
$ find -name libtoscomm.so
$ find -name libgetenv.so
````
```
$ sudo cp <find-path>/libtoscomm.so /usr/lib
$ sudo cp <find-path>/libgetenv.so /usr/lib
```
```
$ motelist
$ sudo chmod 777 /dev/ttyUSB0
```
# How to install influxdb 1.2.0 on raspberry pi

```
$ wget https://dl.influxdata.com/influxdb/releases/influxdb_1.2.0_armhf.deb
$ sudo dpkg -i influxdb_1.2.0_armhf.deb
$ sudo service influxd start
```


