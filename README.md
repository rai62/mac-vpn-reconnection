# VPN Reconnection Script on Mac

Mac OS can't reconnect VPN automatically by default once it is disconnected.

This script enables it to reconnect VPN automatically.


## How to set up

Execute `setup.sh` like the following `bash` command in your `mac-vpn-reconnection` directory.

```
cd mac-vpn-reconnection
bash setup.sh YOUR_VPN_NAME
```


## How to delete reconnection settings

Execute `kill_vpn_reconnection.sh` like the following `bash` command in your `mac-vpn-reconnection` directory.

```
cd mac-vpn-reconnection
bash kill_vpn_reconnection.sh YOUR_VPN_NAME
```

This `YOUR_VPN_NAME` is optional.
You can delete your reconnection settings without stopping your VPN connection when you execute the command like `bash kill_vpn_reconnection.sh` without your VPN name.


## How to ensure that reconnection settings are set

Execute the following command.

```
launchctl list | grep reconnectvpn
```

Output example:

```
(PID	Status	Label)
-	0	reconnectvpn
```

Nothing is output if your reconnection settings are not set.


### Troubleshooting

Make sure that you execute `setup.sh` in your `mac-vpn-reconnection` directory if you get the following output like `Status` is `127`.

```
(PID	Status	Label)
-	127	reconnectvpn
```

This script must be executed after you move to your `mac-vpn-reconnection` directory by executing `cd` command.
