part of coUworldmap;

class MiscLocation extends PlayerLocation {
	String description;
	String url;

	MiscLocation(LatLng location, String city, {this.description, this.url}) : super(location, city);
}

abstract class MiscLocations {
	static final Icon ICON = new Icon()
		..url = 'img/pin.png';

	static final List<MiscLocation> LOCATIONS = [];

	static void displayAll(GMap map) {
		LOCATIONS.forEach((MiscLocation misc) {
			String title = '${misc.city}';

			if (misc.description != null) {
				title = misc.description + ' in ' + title;
			}

			Marker marker = new Marker(new MarkerOptions()
				..position = misc.location
				..title = title
				..cursor = 'help'
				..icon = ICON
				..map = map);

			if (misc.url != null) {
				marker
					..clickable = true
					..cursor = 'pointer'
					..onClick.listen((_) => window.open(misc.url, '_blank'));
			}
		});
	}
}