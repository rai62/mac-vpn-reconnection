#!/bin/bash
set -e

launchctl unload ~/Library/LaunchAgents/reconnectvpn.plist
rm ~/Library/LaunchAgents/reconnectvpn.plist

if [[ $# == 1 ]]; then
  echo "VPN connection terminates"
  networksetup -disconnectpppoeservice "${1}"
fi