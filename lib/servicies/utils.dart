import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> openMap(GeoPoint geolocation) async {
    if (TargetPlatform.android == defaultTargetPlatform ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
        await MapLauncher.showMarker(
          mapType: MapType.google,
          coords: Coords(geolocation.latitude, geolocation.longitude),
          title: "Location",
          description: "A",
        );
      }
    } else {
      launchUrl(Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${geolocation.latitude},${geolocation.longitude}'));
    }
  }
}
