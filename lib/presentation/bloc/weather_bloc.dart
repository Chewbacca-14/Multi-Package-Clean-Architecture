import 'package:multi_package_clean_architecture/domain/weather.dart';

abstract class WeatherEvents {}

class GetWEatherEvent extends WeatherEvents {
  final String cityName;

  GetWEatherEvent({required this.cityName});
}

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final Weather weather;

  WeatherSuccessState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}
