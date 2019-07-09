counts = 0
cnt = "1"

print("Main routine started")

function counter()
        counts = counts + 1
        print(counts)
end

gpio.mode(2, gpio.INT)
gpio.trig(2, 'down', counter)
-- is pin 3 = D2 NodeMCU

function dataReady()
        --counts = 6
        cnt = tostring(counts)
        print("Counted " .. cnt)       
        counts = 0
        sendData(cnt)
        end


function sendData(cnt)
   url = "http://texasmicrodevices.com/cgi-bin/rad_post.py?rad="..cnt
   http.get(url, nil,
         function(code, data)
            if (code < 0) then
              print("HTTP request failed")
            else
              print(code, data)
            end
            print("Heap: "..node.heap().." bytes");
            for i=1,20000 do
                i = i
               end
         end)
end

tmr.alarm(0, 60000, 1, function() dataReady() end) 
