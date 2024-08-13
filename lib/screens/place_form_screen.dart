// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:io';

import 'package:dart_flutter_maps/models/place.dart';
import 'package:dart_flutter_maps/providers/great_places.dart';
import 'package:dart_flutter_maps/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    File? _selectedImage;

    void selectImage(File pickedImage) {
      _selectedImage = pickedImage;
    }

    void submitForm() {
      if (_formKey.currentState!.saveAndValidate()) {
        if (_selectedImage == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Selecione uma imagem!'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        final values = _formKey.currentState!.value;

        Provider.of<GreatPlaces>(context, listen: false).addPlace(
          values['Nome'] as String,
          PlaceLocation(
            latitude: 0,
            longitude: 0,
            address: '',
          ),
          _selectedImage!,
        );

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Place_form"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderTextField(
                name: 'Nome',
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required()],
                ),
              ),
              const SizedBox(height: 15),
              ImageInput(onSelectImage: selectImage),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  submitForm();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
