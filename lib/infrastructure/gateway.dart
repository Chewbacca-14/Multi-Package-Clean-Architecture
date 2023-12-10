import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';
import 'package:multi_package_clean_architecture/domain/weather.dart';
import 'package:multi_package_clean_architecture/infrastructure/services/dio_client.dart';

abstract interface class IGateWay {
  Future<Weather> getWeather(String cityName);
  Future<List<City>> getCityList(String cityName);
}

@Injectable(as: IGateWay)
class GateWay implements IGateWay {
  final DioClient apiClient = DioClient();
  @override
  Future<Weather> getWeather(String cityName) async {
    var response = await apiClient.dio.get('/v1/weather?city=$cityName',
        options: Options(headers: {
          'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'
        }));

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

  @override
  Future<List<City>> getCityList(String cityName) async {
    var response = await apiClient.dio.get('/v1/city?name=$cityName&limit=30',
        options: Options(headers: {
          'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'
        }));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      final List<City> cities =
          responseData.map((data) => City.fromJson(data)).toList();
      return cities;
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
