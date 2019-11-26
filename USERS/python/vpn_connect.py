import os
import subprocess
import time
import threading

# https://stackoverflow.com/questions/42499299/python-threading-multiple-while-true-loops
    
subprocess.call(["networksetup","-disconnectpppoeservice","VPN (L2TP)"]) 
while True:
    subprocess.call(["networksetup","-connectpppoeservice","VPN (L2TP)"]) 
    time.sleep(5)
