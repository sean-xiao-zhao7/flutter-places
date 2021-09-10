import 'package:flutter/foundation.dart';
import '../models/place_model.dart';
import 'dart:io';
import '../db/db.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final place = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );
    _places.add(place);
    notifyListeners();
    DB.insert(
        'places', {'id': place.id, 'title': place.title, 'image': place.image});
  }

  Future<void> fetchAndSetPlaces() async {
    final list = await DB.getData('places');
    print(list);
    _places = list
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null))
        .toList();
    notifyListeners();
  }
}
