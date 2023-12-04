import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';
import 'package:multi_package_clean_architecture/infrastructure/api_client.dart';

class CityUseCasesImpl implements CityUseCases {
  final ApiClient apiClient = ApiClient();
  @override
  Future<List<City>> getCityList(String cityName) async {
    Dio dio = Dio();
    var response = await apiClient.fetchData(
        baseUrl: 'https://api.api-ninjas.com/v1/city?name=$cityName&limit=30',
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'});

    if (response.statusCode == 200) {
      log('$response');
      final List<dynamic> responseData = response.data;
      final List<City> cities =
          responseData.map((data) => City.fromJson(data)).toList();
      return cities;
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load cities');
    }
  }
}
