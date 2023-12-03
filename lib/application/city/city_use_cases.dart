import 'package:multi_package_clean_architecture/domain/city.dart';

abstract interface class CityUseCases {
  Future<List<City>> getCityList(String cityName);
}
