# networksetup -connectpppoeservice "VPN (L2TP)"

if [ ! -d "/tmp/xxx" ]
   then
       mkdir /tmp/xxx
   else
        echo "Directory already exist."
fi


if [ ! -d "/tmp/yyy" ]
   then
       mkdir /tmp/yyy
   else
        echo "Directory already exist."
fi


if [ ! -d "/tmp/zzz" ]
   then
       mkdir /tmp/zzz
   else
        echo "Directory already exist."
fi


. /Users/djzhang/shellstartup.config
echo "runios=$runios" 

if [ "$runios" == "1" ]; then
    echo "Strings are equal"
    open -a Simulator
else
    echo "Strings are not equal"
fi
