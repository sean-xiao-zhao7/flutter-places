import 'package:flutter/foundation.dart';
import 'dart:io';

class Location {
  final double latitude;
  final double longitude;
  final String address;

  Location(this.latitude, this.longitude, {this.address});
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    this.image,
  });
}
