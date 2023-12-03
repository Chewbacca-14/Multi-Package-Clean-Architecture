// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final double temp;
  final double feelsLike;

  Weather({required this.temp, required this.feelsLike});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}
