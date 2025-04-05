firmware = "broadex 1.00.1"
broadcomm_device = "READCOMM 110"
core_level = "1 ROM"

import time
import os

print("SINGLE CORE FIRMWARE!")


time.sleep(5)

#ASCII banner, you chan change it, this project is open-source :)

ascii = r"""____                      _           
 |  _ \                    | |          
 | |_) |_ __ ___   __ _  __| | _____  __
 |  _ <| '__/ _ \ / _` |/ _` |/ _ \ \/ /
 | |_) | | | (_) | (_| | (_| |  __/>  < 
 |____/|_|  \___/ \__,_|\__,_|\___/_/\_\
                                        
                             V1.00.1           """
                                        
print(ascii)

while True:
	cmd = input("$ ")
	
	if cmd.lower() == "sysclose":
		print("SYSCLOSE: SHUTTING DOWN...")
		time.sleep(2)
		exit()
		
	if cmd == "sysfetch":
		print("Firmware/ROM:", firmware, "Broadcomm device:", broadcomm_device, "Core-level:", core_level)
		
	elif cmd == "restart --session":
		print("rebooting... session...")
		time.sleep(3)
		print("SINGLE CORE FIRMWARE!")
		time.sleep(5)
		print(ascii)
		
	elif cmd == "help":
		print("restart --session: Restarts your session, sysfetch: Informations, sysclose: Turning off READCOMM 110, setname: Set your session name, device: Your READCOMM version, setdevname: Set your device name, clear: Clear logs, timeinfo: Shows current date")
		
	elif cmd == "setname":
		session = input("Session name: ")
		print(session, "selected successfully")
		
	elif cmd == "device":
		print(broadcomm_device)
		
	elif cmd == "setdevname":
		devname = input("Select a device name: ")
		print(devname, "selected successfully")
		
	elif cmd == "clear":
		os.system("cls" if os.name == "nt" else "clear")
	
		
	elif cmd == "timeinfo":
		current_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
		print("Current time:", current_time)
		
	else:
		print("Command",cmd, "not found, type help to get list of commands")
