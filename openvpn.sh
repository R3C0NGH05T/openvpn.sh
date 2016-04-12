## Script to connect to openvpn and use vpnbook
## config file, username, and password
##
## This script is built to automate the proxychains and tor service together for stronger anonymity!!!
##
##  Changes your external/public ip everytime you open and close the browser. 
##  Uses four different proxy servers to bounce off US,Canada,Europe,Germany.
##  
## Uses three nameservers from around the US to pass off and return quarries without using any ISP services.
## 

#! /bin/bash

#option rfc3442-classless-static-routes code 121 = array of unsigned integer 8;
#send host-name "andare.fugue.com";
#send host-name = gethostname();
#send dhcp-client-identifier 1:0:a0:24:ab:fb:9c;
#send dhcp-lease-time 3600;
#supersede domain-name "fugue.com home.vix.com";
# prepend domain-name-servers 208.67.222.222, 8.8.8.8, 4.2.2.1;
#request subnet-mask, broadcast-address, time-offset, routers,
#	domain-name, domain-name-servers, domain-search, host-name,
#	dhcp6.name-servers, dhcp6.domain-search,
#	netbios-name-servers, netbios-scope, interface-mtu,
#	rfc3442-classless-static-routes, ntp-servers;
#require subnet-mask, domain-name-servers;
#timeout 60;
#retry 60;
#reboot 10;
#select-timeout 5;
#initial-interval 2;
#script "/etc/dhcp3/dhclient-script";
#media "-link0 -link1 -link2", "link0 link1";
#reject 192.33.137.209;
#
#alias {
#  interface "eth0";
#  fixed-address 192.5.5.213;
#  option subnet-mask 255.255.255.255;
#}
#
#lease {
#  interface "eth0";
#  fixed-address 192.33.137.200;
#  medium "link0 link1";
#  option host-name "andare.swiftmedia.com";
#  option subnet-mask 255.255.255.0;
#  option broadcast-address 192.33.137.255;
#  option routers 192.33.137.250;
#  option domain-name-servers 127.0.0.1;
#  renew 2 2000/1/12 00:00:01;
#  rebind 2 2000/1/12 00:00:01;
#  expire 2 2000/1/12 00:00:01;
#}
##nameserver 208.67.222.222
##nameserver 8.8.8.8
##nameserver 4.2.2.1










cd /root/OpenVPN/
echo ""
echo "#########################################################################"
echo "#########################################################################"
echo "#########################################################################"
figlet "OPENVPN PROXYCHAIN MENU"
echo "#########################################################################"
echo "#########################################################################"
echo "#########################################################################"
echo ""
sleep 5

cowsay -f dragon "Please select the OpenVPN Server OR Proxychain of your choice" 
sleep 5

clear

figlet -c  "1 )  Check Current Public IP" 
figlet -c  "2 )  Proxychain Plus Tor"
figlet -c  "3 )  US Server 1" 
figlet -c  "4 )  US Server 2" 
figlet -c  "5 )  Europe Server 1" 
figlet -c  "6 )  Europe Server 2" 
figlet -c  "7 )  Canada Server 1" 
figlet -c  "8 )  Germany Server 1"
figlet -c  "9 )  Quit"  

read n
case $n in
    1) gksu -u chromeuser google-chrome "https://ipleak.net/";;
    2) systemctl start tor.service; proxychains firefox "https://ipleak.net/";;
    3) cd /root/OpenVPN/USServer1; openvpn vpnbook-us1-tcp80.ovpn; sleep 5;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    4) cd /root/OpenVPN/USServer2; openvpn vpnbook-us2-tcp443.ovpn;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    5) cd /root/OpenVPN/EuropeServer1; openvpn vpnbook-euro1-tcp80.ovpn;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    6) cd /root/OpenVPN/EuropeServer2; openvpn vpnbook-euro2-tcp443.ovpn;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    7) cd /root/OpenVPN/CanadaServer1; openvpn vpnbook-ca1-tcp80.ovpn;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    8) cd /root/OpenVPN/GermanyServer1; openvpn vpnbook-de233-tcp443.ovpn;echo "Connection To US Server 1 Successfull"; firefox "https://ipleak.net"; ;;
    9) inxi -c 3 -Fxi;echo "";date;time; ;; 
    
esac






