part of coUworldmap;

abstract class DevMarkers {
	static final Icon ICON = new Icon()
		..url = 'img/pin_purple.png';

	static final Map<String, LatLng> LOCATIONS = {
		'Austin': new LatLng(30.2672, -97.7431),
		'Berlin': new LatLng(52.5200, 13.4050),
		'Boston': new LatLng(42.3601, -71.0589),
		'Chico': new LatLng(39.7285, -121.8375),
		'Marietta': new LatLng(33.9526, -84.5499),
		'New South Wales': new LatLng(-31.2532, 146.9211),
		'Pittsburgh': new LatLng(40.4406, -79.9959),
		'Portland': new LatLng(45.5231, -122.6765),
		'San Francisco': new LatLng(37.7749, -122.4194),
		'St. Paul': new LatLng(44.9537, -93.0900),
	};

	static void displayAll(GMap map) {
		LOCATIONS.forEach((String city, LatLng location) {
			new Marker(new MarkerOptions()
				..position = location
				..title = 'Developer in $city'
				..cursor = 'help'
				..icon = ICON
				..map = map);
		});
	}
}