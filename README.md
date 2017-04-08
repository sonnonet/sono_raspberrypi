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

# How to Setting TSDB on raspberry Pi

1. step 자바설정
```
    $ which java
    ex) /usr/bin/java 
    $ vim $HOME/.bashrc 
     add end of bottom
   JAVA_HOME=/usr/
   export PATH=$PATH:$JAVA_HOME/bin
   export PATH=$PATH:$HADOOP_HOME/bin
   
   $ source ~/.bashrc
```

2. Hbase install
```
   $ cd /usr/local
   $ sudo mkdir hadoop
   $ cd hadoop
   $ sudo wget http://www.apache.org/dist/hbase/1.3.0/hbase-1.3.0-bin.tar.gz
   $ sudo tar xvf hbase-1.3.0-bin.tar.gz
   $ cd ..
   //$ chown -R pi:pi hadoop
   $ vim conf/hadoop-env.sh
     add end of bottom
     export JAVA_HOME=/usr/
   $ vim conf/hbase-site.xml
   <configureation> </configuration> 
   DIRECTORY -> run of hbase directoy ex) /tmp/hbase-version name
    <property>         
        <name>hbase.rootdir</name>        
        <value>file:///DIRECTORY/hbase</value>       
    </property>       
    <property>         
        <name>hbase.zookeeper.property.dataDir</name>         
        <value>/DIRECTORY/zookeeper</value>        
    </property>
```
3. hbase run
```
    $ sh /usr/local/hadoop/habase-1.3.0/bin/start-hbase.sh
     
```
4. GnuPlot install
```
    $ cd /usr/local
    $ sudo apt-get install gcc libgd2-xpm-dev 
    $ sudo wget http://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.6/gnuplot-5.0.6.tar.gz
    $ sudo chown -R pi:pi gnuplot-5.0.6
    $ sudo ./configure
    $ sudo make install
    $ sudo apt-get install dh-autoreconf
    $ sudo apt-get install gnuplot
``` 
5. OpenTSDB install
``` 
    $ cd /usr/local
    $ sudo git clone git://github.com/OpenTSDB/opentsdb.git
    $ sudo chown -R pi:pi opentsdb
    $ cd opentsdb
    $ ./build.sh
    $ sudo env COMPRESSION=NONE HBASE_HOME=/usr/local/hadoop/hbase-1.3.0 ./src/crete_table.sh
```
