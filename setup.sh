#!/bin/bash
set -e

if [[ $# == 1 ]]; then
  VPN_NAME=${1}
else
  echo "VPN name is not set"
  echo "Set your VPN name like \"bash setup.sh VPN_NAME\""
  exit 0
fi

cat <<SETING >> reconnectvpn.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>reconnectvpn</string>
	<key>ProgramArguments</key>
	<array>
		<string>sh</string>
		<string>-c</string>
		<string>bash $(pwd)/reconnect_vpn.sh "$VPN_NAME"</string>
	</array>
	<key>StartInterval</key>
	<integer>5</integer>
</dict>
</plist>
SETING

mv reconnectvpn.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/reconnectvpn.plist