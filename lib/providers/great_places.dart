// ignore_for_file: prefer_final_fields

import 'package:dart_flutter_maps/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _itens = [];

  List<Place> get itens {
    return [..._itens];
  }

  int get constItens {
    return _itens.length;
  }

  Place getItemByItem(int idx) {
    return itens[idx];
  }
}
