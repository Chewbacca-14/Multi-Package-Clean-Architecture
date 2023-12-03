import 'package:multi_package_clean_architecture/domain/weather.dart';

abstract interface class CityUseCases {
  Future<Weather> getWeather(double longitude, double latitude);
}
