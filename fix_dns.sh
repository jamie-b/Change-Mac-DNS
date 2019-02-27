#!/bin/bash
echo "Current DNS servers for Wi-Fi adapter:"
networksetup -getdnsservers Wi-Fi
echo 
echo "Clearing DNS Server settings for Wi-Fi adapter"
networksetup -setdnsservers Wi-Fi empty
echo 
echo "Setting new DNS Server settings for Wi-Fi adapter"
networksetup -setdnsservers Wi-Fi 9.9.9.9 8.8.8.8
echo 
echo "New DNS Servers configured as:"
networksetup -getdnsservers Wi-Fi
echo
echo "Flushing DNS cache"
killall -HUP mDNSResponder
echo 
echo "Confirming resolver configuration:"
scutil --dns | grep 'nameserver\[[0-9]*\]'
echo 
echo "Done!"
