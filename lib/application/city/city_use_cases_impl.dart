import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';
import 'package:multi_package_clean_architecture/infrastructure/gateway.dart';

@LazySingleton(as: CityUseCases)
class CityUseCasesImpl implements CityUseCases {
  final IGateWay gateWay;

  CityUseCasesImpl(this.gateWay);

  @override
  Future<List<City>> getCityList(String cityName) {
    return gateWay.getCityList(cityName);
  }
}
