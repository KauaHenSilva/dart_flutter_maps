import 'package:dart_flutter_maps/providers/great_places.dart';
import 'package:dart_flutter_maps/screens/place_form_screen.dart';
import 'package:dart_flutter_maps/screens/places_list_screen.dart';
import 'package:dart_flutter_maps/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GreatPlaces()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      initialRoute: MyRoutes.placesList,
      routes: {
        MyRoutes.placesList: (ctx) => const PlacesListScreen(),
        MyRoutes.placeForm: (ctx) => const PlaceFormScreen(),
      },
    );
  }
}
