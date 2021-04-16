serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_Tshake = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_Tshake = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Tshake_Info_Sudo = io.open("sudo.lua", 'w')
Tshake_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Tshake_Info_Sudo:close()
end  
if not database:get(Server_Tshake.."Token_Tshake") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_Tshake.."Token_Tshake",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_Tshake.."UserName_Tshake") then
io.write('\n\27[1;35mSend UserName For Sudo : ارسل معرف المطور الاساسي ...\n\27[0;39;49m')
local User_Sudo = io.read():gsub('@','')
if User_Sudo ~= '' then
 
 io.write('\27[0;35m\n ارسل لي ايدي المطور الاساسي ↓ :\na≪━━━━━━𝙋𝙊𝙒𝙀𝙍 ⶄ━━━━━━≫\n\27[0;33;49m')
local SUDOID = io.read()
 
io.write('\n\27[1;31m• The UserNamr Is Saved : تم حفظ معرف المطور الاسي واستخراج ايدي \n\27[0;39;49m')
 
database:set(Server_Tshake.."UserName_Tshake",User_Sudo)
database:set(Server_Tshake.."Id_Tshake",SUDOID)
else
io.write('\n\27[1;31mThe UserName was not Saved : لم يتم حفظ معرف Carbon\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end

local function Files_Tshake_Info()
Create_Info(database:get(Server_Tshake.."Token_Tshake"),database:get(Server_Tshake.."Id_Tshake"),database:get(Server_Tshake.."UserName_Tshake"))   
local RunTshake = io.open("Tshake", 'w')
RunTshake:write([[
#!/usr/bin/env bash
cd $HOME/TshAkEx
token="]]..database:get(Server_Tshake.."Token_Tshake")..[["
      
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Tshake.lua -p PROFILE --bot=$token
done
]])
RunTshake:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/TshAkEx
while(true) do
rm -fr ../.telegram-cli
screen -S TshAkE -X kill
screen -S TshAkE ./Tshake
done
]])
RunTs:close()
end
Files_Tshake_Info()
database:del(Server_Tshake.."Token_Tshake");database:del(Server_Tshake.."Id_Tshake");database:del(Server_Tshake.."UserName_Tshake")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_Tshake()  
var = true
else   
f:close()  
database:del(Server_Tshake.."Token_Tshake");database:del(Server_Tshake.."Id_Tshake");database:del(Server_Tshake.."UserName_Tshake")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
