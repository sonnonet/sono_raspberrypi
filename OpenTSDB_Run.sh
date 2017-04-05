cd /usr/local/hbase/hbase-1.0.1.1/bin/
sudo ./stop-hbase.sh
sudo ./start-hbase.sh

cd /opt/opentsdb
JAVA_HOME=/usr COMPRESSION="NONE" HBASE_HOME="/usr/local/hbase/hbase-1.0.1.1" ./src/create_table.sh
tsdtmp=${TMPDIR-'/usr/local/data'}/tsd 
sudo screen -dmS tsdb ./build/tsdb tsd --port=4242 --staticroot=build/staticroot --cachedir=/usr/local/data --auto-metric &
