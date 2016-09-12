part of coUworldmap;

class PlayerLocation {
	LatLng location;
	String city;

	PlayerLocation(this.location, this.city);
}

abstract class PlayerMarkers {
	static final Icon ICON = new Icon()
		..url = 'img/pin_teal.png';

	static Future<List<String>> getServerIps() async {
		try {
			String json = await HttpRequest.getString('http://server.childrenofur.com:8181/addresses');
			return JSON.decode(json);
		} catch (e) {
			print('Error getting IPs from server: $e');
			return [];
		}
	}

	static Future<PlayerLocation> locateIp(String ip) async {
		try {
			// Look up address
			String json = await HttpRequest.getString('http://freegeoip.net/json/$ip');
			Map<String, dynamic> data = JSON.decode(json);

			// Make sure data exists
			assert(data['latitude'] != null && data['latitude'] != '');
			assert(data['longitude'] != null && data['longitude'] != '');
			assert(data['city'] != null && data['city'] != '');

			// Parse location
			LatLng location = new LatLng(data['latitude'], data['longitude']);
			assert (location != CENTER);
			return new PlayerLocation(location, data['city']);
		} catch (e) {
			print('Error getting location for $ip: $e');
			return null;
		}
	}

	static Future<bool> displayAll(GMap map) async {
		try {
			List<String> playerIps = await getServerIps();

			Future.forEach(playerIps, (String ip) async {
				PlayerLocation location = await locateIp(ip);

				if (location == null) {
					return;
				}

				new Marker(new MarkerOptions()
					..position = location.location
					..title = 'Player near ${location.city}'
					..cursor = 'help'
					..icon = ICON
					..map = map);
			});

			return true;
		} catch (e) {
			print('Error displaying player locations: $e');
			return false;
		}
	}
}