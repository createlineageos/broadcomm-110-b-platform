firmware = "broadex 1.0"
broadcomm_device = "BROADCOMM 110"
core_level = "1 ROM"

import time

print("SINGLE CORE FIRMWARE!")


time.sleep(10)

#ASCII banner, you chan change it, because this project is open-source :)

ascii = r"""____                      _           
 |  _ \                    | |          
 | |_) |_ __ ___   __ _  __| | _____  __
 |  _ <| '__/ _ \ / _` |/ _` |/ _ \ \/ /
 | |_) | | | (_) | (_| | (_| |  __/>  < 
 |____/|_|  \___/ \__,_|\__,_|\___/_/\_\
                                        
                             V1.0           """
                                        
print(ascii)

while True:
	cmd = input("$ ")
	
	if cmd.lower() == "sysclose":
		print("SYSCLOSE: SHUTTING DOWN...")
		time.sleep(2)
		exit()
		
	if cmd == "sysfetch":
		print("Firmware/ROM:", firmware, "Broadcomm device:", broadcomm_device, "Core-level:", core_level)
		
	else:
		print("Command",cmd, "not found")
