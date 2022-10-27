import os
import subprocess
import time
import threading
import urllib.request


def checkInternetUrllib():
    try:
        urllib.request.urlopen('http://google.com', timeout=5) 
        print ('true')
        return True
    except:
        print ('false')
        return False

# https://stackoverflow.com/questions/42499299/python-threading-multiple-while-true-loops
subprocess.call(["networksetup","-disconnectpppoeservice","VPN (L2TP)"]) 
while True:
    if not checkInternetUrllib() :
       subprocess.call(["networksetup","-connectpppoeservice","VPN (L2TP)"]) 
    time.sleep(15)