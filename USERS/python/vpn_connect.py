import os
import subprocess
import time
import threading
import urllib.request


def checkInternetUrllib(url='http://google.com', timeout=3):
    try:
        urllib.request.urlopen(url, timeout=timeout)
        return True
    except Exception as e:
        print(e)
        return False

# https://stackoverflow.com/questions/42499299/python-threading-multiple-while-true-loops
subprocess.call(["networksetup","-disconnectpppoeservice","VPN (L2TP)"]) 
while True:
    if not checkInternetUrllib() :
       subprocess.call(["networksetup","-connectpppoeservice","VPN (L2TP)"]) 
    time.sleep(15)