import 'package:multi_package_clean_architecture/domain/weather.dart';

abstract interface class WeatherUseCases {
  Future<Weather> getWeather(String cityName);
}
