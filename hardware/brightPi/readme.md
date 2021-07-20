# Bright-Pi
  - The Bright-Pi is a small little board based around the Semtech SC620 that powers 4 white LEDs and 8 infrared ones.

## reference URL
  https://github.com/PiSupply/Bright-Pi
  
## Setup
  ```
  # Run this line and Bright Pi will be setup and installed
  $> curl -sSL https://pisupp.ly/brightpicode | bash
  ```
  
## Python API
  - The Basic API
  ```
# Global variables to quickly reference to groups of LEDs or individual ones.
# The LED* ones can only be used on their own.
LED_ALL = (1, 2, 3, 4, 5, 6, 7, 8)
LED_IR = LED_ALL[4:8]
LED_WHITE = LED_ALL[0:4]
LED1 = (1,)
LED2 = (2,)
LED3 = (3,)
LED4 = (4,)
LED5 = (5,)
LED6 = (6,)
LED7 = (7,)
LED8 = (8,)

ON = 1
OFF = 0

# reset method is used to reset the SC620 to its original state.
reset()

# get_gain and set_gain retrieve and set the gain for all LEDs.
get_gain()
# Gain from min 0 (0b0000) to max 15 (0b1111).
set_gain(gain)

# get_led_on_off and set_led_on_off retrieve and set the on/off status of the LEDs.
# White LEDs:
#   1, 2, 3, 4
# IR LEDs (in pairs)
#   5, 6, 7, 8
# leds is a tuple or array of LEDs for which you require a status.
get_led_on_off(leds)
# leds is a tuple or array of LEDs for which you are setting the status as state.
set_led_on_off(leds, state)

# get_dim and set_dim retrieve and set the dim for the specified LEDs.
get_led_dim()
# Dim from 0 (0x00) to 50 (0x32).
# leds is a tuple or array of LEDs for which you are setting the dimming level as dim.
set_led_dim(leds, dim)
  ```

  

  
