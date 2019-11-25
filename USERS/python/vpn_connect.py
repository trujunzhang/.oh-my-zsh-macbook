import os
import subprocess
import time
import threading

# https://stackoverflow.com/questions/42499299/python-threading-multiple-while-true-loops
while True:
    subprocess.call(["networksetup","-connectpppoeservice","VPN (L2TP)"]) 
    time.sleep(15)
