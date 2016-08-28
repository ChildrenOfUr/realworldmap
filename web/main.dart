library coUworldmap;

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:google_maps/google_maps.dart';

part 'lib/devmarkers.dart';
part 'lib/playermarkers.dart';

final LatLng CENTER = new LatLng(0, 0);

void main() {
	final MapOptions MAP_OPTIONS = new MapOptions()
		..center = CENTER
		..draggable = true
		..mapTypeControl = false
		..rotateControl = false
		..streetViewControl = false
		..zoomControl = true
		..zoom = 2
		..minZoom = 2;

	final GMap MAP = new GMap(querySelector('#map'), MAP_OPTIONS);

	DevMarkers.displayAll(MAP);
	PlayerMarkers.displayAll(MAP);
}