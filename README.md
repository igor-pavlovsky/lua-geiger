# lua-geiger
ESP8266 WiFi module with Lua code for Geiger counter

This is an example of using embedded Lua for an IoT device based on commercially available NodeMCU modules with ESP8266 (ver. ESP-12) Wi-Fi chip and a Geiger counter.

Before using the Lua code, the module was flashed with the Lua interpreter firmware that can be generated [here](https://nodemcu-build.com/). The firmware also supported the TLS/SSL protocol to be able to send requests to the server over https. The firmware was flashed using the NodeMCU [flasher](https://github.com/nodemcu/nodemcu-flasher), although new flashing tools are available as of 2018. Finally, the Lua code was edited and uploaded to the module over the serial interface using [ESPlorer](https://github.com/4refr0nt/ESPlorer).

1. A few notes on the hardware

The module can be powered either from a USB port during programming, or using an external power supply, +3.3V or +5V. In this project, the module was powered directly from a Geiger counter. A commercially available Bella counter was slightly modified to provide +5V power for the module and the conditioned pulse output. A diagram below shows the module pinout and connections.

![Alt text](http://www.texasmicrodevices.com/w/wp-content/uploads/2019/05/nodemcu-geiger.gif)

After the code is debugged and the module is functional, the module can be unplugged from the USB port and reconnected to the Geiger counter using external wiring connected directly to the module pins.

2. Lua code: three scripts

Architecture of the Lua code with this module is quite straightforward. The **init.lua** file is by default the first script with the code that is executed at startup. It contains serial port initialization parameters and introduces some delay before going further: this delay is needed  to prevent potential infinite looping or other bugs that may take over the control of the ESP8266. During this delay the code can be rewritten and/or the bugs fixed. 

After a 12 second delay, **rout.lua** script is executed and the module will try to connect to the router to obtain local IP address. 

Finally, after the IP address is obtained by the module, **rad.lua** script is executed and the module will start counting pulses. If we want to obtain environmental radiation levels in counts per minute (CPM), we should configure the timer to count for 60 seconds before sending the result via request to the server. The url in this last script sends a request to the server configured to run a python CGI script. 

3. Example Python backend script to process/save the data

The **rad_post.py** script is then executed to process the GET request from the module.  One working example of the script that saves the data locally may be the following.

Finally, the result can be seen [here](http://texasmicrodevices.com/w/lua-for-iot-geiger-counter-with-nodemcu/) (at the bottom of the page). The Geiger counter sits on my window in a suburb of Austin, TX.
