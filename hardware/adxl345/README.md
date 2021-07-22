## 라즈베리파이 update & upgrade
  - sudo apt-get update
  - sudo apt-get upgrade
  
## 라즈베리파이 I2C설정
  - sudo raspi-config
  - 3.Interface Options
  - I2C enable
  - sudo reboot
  
## 라즈베리파이 & ADXL345 연결
<img width="" height="" src="../png/adxl345.png"></img>
  
## I2C패키지 설치
  - sudo apt-get install python3-dev python3-pip python3-smbus i2c-tools -y
  
## I2C 테스트
  - sudo i2cdetect -y 1
  
## ADXL345센서 값 influxDB 저장
$ python3 influx_ADXL345.py
```
import time
import board
import busio
import adafruit_adxl34x

i2c = busio.I2C(board.SCL, board.SDA)
accelerometer = adafruit_adxl34x.ADXL345(i2c)

while True:
    x, y, z = accelerometer.acceleration
    data = [{
        'measurement' : 'xyz',
        'tags':{
            'tagID' : 1,
        },
        'fields':{
            'x' : x,
            'y' : y,
            'z' : z,
        }
    }]
    client = None
    try:
        client = influxdb('localhost',8086,'root','root','WaterMeter')
    except Exception as e:
        print("Exception " + str(e))
    if client is not None:
        try:
            client.write_points(data)
        except Exception as e:
            print("Exception write " + str(e))
        finally:
            client.close()
```
