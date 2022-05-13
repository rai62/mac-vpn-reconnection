#!/bin/bash
set -e

if [[ $# == 1 ]]; then
  is_connected=$(networksetup -showpppoestatus "${1}")

  if [[ ${is_connected} == "connected" ]]; then
    echo "VPN is connected"
  elif [[ ${is_connected} == "disconnected" ]]; then
    echo "VPN is disconnected"
    echo "VPN connection starts"
    networksetup -connectpppoeservice "${1}"
  fi

else
  echo "VPN name is not set"
  echo "Set your VPN name like \"bash reconnect_vpn.sh YOUR_VPN_NAME\""
fi
