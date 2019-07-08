# lua-geiger
ESP8266 WiFi module with Lua code for Geiger counter

This is an example of using embedded Lua for an IoT device based on commercially available NodeMCU modules with ESP8266 (ver. ESP-12) Wi-Fi chip and a Geiger counter.

Before using the Lua code, the module was flashed with the Lua interpreter firmware that can be generated here. The firmware also supported the TLS/SSL protocol to be able to send requests to the server over https. The firmware was flashed using the NodeMCU flasher, although new flashing tools are available as of 2018. Finally, the Lua code was edited and uploaded to the module over the serial interface using ESPlorer.

1. A few notes on the hardware
The module can be powered either from a USB port during programming, or using an external power supply, +3.3V or +5V. In this project, the module was powered directly from a Geiger counter. A commercially available Bella counter was slightly modified to provide +5V power for the module and the conditioned pulse output. A diagram below shows the module pinout and connections.

