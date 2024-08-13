import 'package:dart_flutter_maps/screens/place_form_screen.dart';
import 'package:dart_flutter_maps/screens/places_list_screen.dart';
import 'package:dart_flutter_maps/utils/my_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.placesList,
      routes: {
        MyRoutes.placesList: (ctx) => const PlacesListScreen(),
        MyRoutes.placeForm: (ctx) => const PlaceFormScreen(),
      },
    );
  }
}
