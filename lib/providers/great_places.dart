// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:dart_flutter_maps/models/place.dart';
import 'package:dart_flutter_maps/utils/db_utils.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _itens = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtils.getData('place');
    _itens = dataList.map(Place.fromJson).toList();
  }

  List<Place> get itens {
    return [..._itens];
  }

  int get constItens {
    return _itens.length;
  }

  Place getItemByItem(int idx) {
    return itens[idx];
  }

  void addPlace(String title, PlaceLocation location, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: location,
      image: image,
    );

    _itens.add(newPlace);

    DbUtils.insert('place', newPlace.toJson());

    notifyListeners();
  }
}
