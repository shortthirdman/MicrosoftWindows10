## [Connecting and/or Exporting Wi-Fi profile](https://www.windowscentral.com/how-connect-wi-fi-network-windows-10)

* View the available network profiles
	`netsh wlan show profile`

* Export a profile
	`netsh wlan export profile PROFILE-NAME key=clear folder=PATH\TO\EXPORT\FOLDER`

* Connect a profile
	`netsh wlan connect ssid=YOUR_WIFI_SSID name=PROFILE_NAME`

* Connect a profile by interface
	`wlan connect ssid=YOUR_WIFI_SSID name=PROFILE_NAME interface=Wi-Fi`

* Determine the name of the network adapter
	`netsh wlan show interfaces`

* Import the network profile
	`netsh wlan add profile filename="PATH\TO\PROFILE.XML" Interface="YOUR_WIFI_ADAPTER_NAME" user=current`
