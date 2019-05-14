#!/bin/bash
#
#
# MIHAI - 2019
# This is transforming you Ubuntu machine into a NAT router
echo "####################################################################################"
echo " In this part there will be display all the information regarding the interfaces"
echo "available on this Machine"
echo ""
sudo ifconfig 
echo ""
sleep 2s 
# This line it adding a sleep time of 2 seconds in order to make the user focusing on the
#choose of the interfaces on the machine
# I am asking the name of the interface with the internet access
echo "####################################################################################"
echo "Please, input using the keyboard the name of the interface with the INTERNET access:"
read output_interface
echo "####################################################################################"
echo "Please, input using the keyboard the name of the interface with the LAN access:"
read input_interface
echo ""
echo "####################################################################################"
echo "# The interfaces summary..                                                         #"
echo "# OUTPUT   Interface: $output_interface                                            #"
echo "# INTERNAL Interface: $input_interface                                             #"
echo "####################################################################################"
echo ""
echo " The configuration is loading..."
echo ""
#iptables roules for routing the traffic from one interface to another 
#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
#sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
#sudo iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT

sudo iptables -t nat -A POSTROUTING -o $output_interface -j MASQUERADE
sudo iptables -A FORWARD -i $input_interface -o $output_interface -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $input_interface -o $output_interface -j ACCEPT

echo " The configuration is loaded!"
echo "####################################################################################"
