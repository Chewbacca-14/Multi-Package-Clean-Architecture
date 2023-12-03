import 'package:flutter_test/flutter_test.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases_impl.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';

void main() {
  test('test should print list of cities', () async {
    CityUseCases cityUseCases = CityUseCasesImpl();
   final cities = await cityUseCases.getCityList('pra');

   expect(cities, isList);
  });
}