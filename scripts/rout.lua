--init.lua
print("Connecting to router...")
wifi.setmode(wifi.STATION)
wifi.sta.config("IMAGENESIS","4953830701")
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function() 
  if wifi.sta.getip()== nil then 
    print("IP unavaiable, Waiting...") 
  else 
    tmr.stop(1)
    print("Config done, IP is " .. wifi.sta.getip())
    dofile("rad.lua")
  end 
end)
