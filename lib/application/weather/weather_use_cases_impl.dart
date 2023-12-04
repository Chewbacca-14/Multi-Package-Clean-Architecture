import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multi_package_clean_architecture/application/weather/weather_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/weather.dart';
import 'package:multi_package_clean_architecture/infrastructure/api_client.dart';

class WeatherUseCasesImpl implements WeatherUseCases {
  final ApiClient apiClient = ApiClient();
  @override
  Future<Weather> getWeather(String cityName) async {
    Dio dio = Dio();
    var response = await apiClient.fetchData(
        baseUrl: 'https://api.api-ninjas.com/v1/weather?city=$cityName',
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'});
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.data);

      return Weather.fromJson(
        jsonDecode(response.data),
      );
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load weather');
    }
  }
}
