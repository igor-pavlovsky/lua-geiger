-- init.lua
uart.setup(0, 115200, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)  

print('=====================+++++++++++++====')
print('Starting Wi-Fi Module in 12 seconds...')
print("Heap: "..node.heap().." bytes");

function startup()

dofile('rout.lua')
end;

tmr.alarm(0,12000,0,startup)
