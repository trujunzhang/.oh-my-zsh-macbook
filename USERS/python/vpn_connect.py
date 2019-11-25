import os
import subprocess
import time
import threading

while True:
    subprocess.call(["networksetup","-connectpppoeservice","VPN (L2TP)"]) 
    time.sleep(15)
