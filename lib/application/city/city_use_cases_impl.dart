import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';




class CityUseCasesImpl implements CityUseCases {
  @override
  Future<List<City>> getCityList(String cityName) async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://api.api-ninjas.com/v1/city?name=$cityName&limit=30',
      options: Options(
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'},
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.data);
      final List<City> cities = responseData
          .map((data) => City.fromJson(data))
          .toList();
      return cities;
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load cities');
    }
  }
}

