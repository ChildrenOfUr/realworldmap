part of coUworldmap;

class DevLocation extends PlayerLocation {
	int count;

	DevLocation(LatLng location, String city, [this.count = 1]) : super(location, city);
}

abstract class DevMarkers {
	static final Icon ICON = new Icon()
		..url = 'img/pin_purple.png';

	static final List<DevLocation> LOCATIONS = [
		new DevLocation(new LatLng(30.2672, -97.7431), 'Austin'),
		new DevLocation(new LatLng(52.5200, 13.4050), 'Berlin'),
		new DevLocation(new LatLng(42.3601, -71.0589), 'Boston'),
		new DevLocation(new LatLng(39.7285, -121.8375), 'Chico'),
		new DevLocation(new LatLng(39.7392, -104.9903), 'Denver', 2),
		new DevLocation(new LatLng(53.5511, 9.9937), 'Hamburg'),
		new DevLocation(new LatLng(33.9526, -84.5499), 'Marietta'),
		new DevLocation(new LatLng(-31.2532, 146.9211), 'New South Wales'),
		new DevLocation(new LatLng(38.8814, -94.8191), 'Olathe'),
		new DevLocation(new LatLng(40.4406, -79.9959), 'Pittsburgh', 2),
		new DevLocation(new LatLng(45.5231, -122.6765), 'Portland'),
		new DevLocation(new LatLng(37.7749, -122.4194), 'San Francisco'),
		new DevLocation(new LatLng(44.9537, -93.0900), 'St. Paul'),
	];

	static void displayAll(GMap map) {
		LOCATIONS.forEach((DevLocation dev) {
			new Marker(new MarkerOptions()
				..position = dev.location
				..title = '${dev.count == 1 ? 'Developer' : '${dev.count} developers'} in ${dev.city}'
				..cursor = 'help'
				..icon = ICON
				..map = map);
		});
	}
}