# All values MUST be placed inside 'single quotes'
# DO NOT use these special characters within values: \ " '
wget https://git.io/vpnsetup -O vpnsetup.sh && sudo \
VPN_IPSEC_PSK='wh' \
VPN_USER='test' \
VPN_PASSWORD='test' \
sh vpnsetup.sh


================================================

IPsec VPN server is now ready for use!

Connect to your new VPN with these details:

Server IP: 50.1xx.166.109
IPsec PSK: wh
Username: test
Password: test

Write these down. You'll need them to connect!

Important notes:   https://git.io/vpnnotes
Setup VPN clients: https://git.io/vpnclients
IKEv2 guide:       https://git.io/ikev2

================================================