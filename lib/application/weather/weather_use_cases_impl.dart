import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/application/weather/weather_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/weather.dart';
import 'package:multi_package_clean_architecture/infrastructure/gateway.dart';

@LazySingleton(as: WeatherUseCases)
class WeatherUseCasesImpl implements WeatherUseCases {
  final IGateWay gateWay;
  WeatherUseCasesImpl(this.gateWay);

  @override
  Future<Weather> getWeather(String cityName) async {
    return gateWay.getWeather(cityName);
  }
}
