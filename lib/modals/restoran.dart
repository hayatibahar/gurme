import 'package:cloud_firestore/cloud_firestore.dart';

class Restoran {
  String name;
  String imageUrl;
  GeoPoint geoPoint;
  String city;
  String district;

  Restoran(
      {required this.name,
      required this.imageUrl,
      required this.geoPoint,
      required this.city,
      required this.district});
}
