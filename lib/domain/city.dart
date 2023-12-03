
import 'dart:convert';

class City {
  final String name;
  final double latitude;
  final double longitude; 
  final String country;

  City({required this.name, required this.latitude, required this.longitude, required this.country});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source) as Map<String, dynamic>);
}
