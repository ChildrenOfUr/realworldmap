part of coUworldmap;

abstract class OverPan {
	static void preventOverPanning(GMap map) {
		map.onCenterChanged.listen((_) {
			num latNorth = map.bounds.northEast.lat;
			num latSouth = map.bounds.southWest.lat;
			num latNew;

			if (latNorth > 85) {
				// Too far north, move down
				latNew = map.center.lat - (latNorth - 85);
			} else if (latSouth < -85) {
				// Too far south, move up
				latNew = map.center.lat - (latSouth + 85);
			}

			if (latNew != null) {
				map.center = new LatLng(latNew, map.center.lng);
			}
		});
	}
}