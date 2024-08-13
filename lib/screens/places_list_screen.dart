import 'package:dart_flutter_maps/providers/great_places.dart';
import 'package:dart_flutter_maps/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus lugares"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.placeForm);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Nenhum local cadastrado!'),
        ),
        builder: (ctx, greatPlaces, ch) {
          return greatPlaces.constItens == 0
              ? Center(
                  child: ch,
                )
              : ListView.builder(
                  itemCount: greatPlaces.constItens,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.getItemByItem(i).image,
                      ),
                    ),
                    title: Text(
                      greatPlaces.getItemByItem(i).title,
                    ),
                    onTap: () {
                      // Go to detail page ...
                    },
                  ),
                );
        },
      ),
    );
  }
}
