import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/application/weather/weather_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/weather.dart';
import 'package:multi_package_clean_architecture/infrastructure/services/api_client.dart';

@LazySingleton(as: WeatherUseCases)
class WeatherUseCasesImpl implements WeatherUseCases {
  final ApiClient apiClient = ApiClient();
  @override
  Future<Weather> getWeather(String cityName) async {
    var response = await apiClient.fetchData(
        baseUrl: 'https://api.api-ninjas.com/v1/weather?city=$cityName',
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'});

    if (response.statusCode == 200) {
      if (response.data is Map<String, dynamic>) {
        return Weather.fromMap(response.data);
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
