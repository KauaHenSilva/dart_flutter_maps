import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.image,
    this.location,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      title: json['title'],
      image: File(json['image']),
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image.path,
    };
  }
}
