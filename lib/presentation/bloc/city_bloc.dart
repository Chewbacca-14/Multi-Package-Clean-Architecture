import 'package:multi_package_clean_architecture/domain/city.dart';

abstract class CityEvents {}

class GetCityListEvent extends CityEvents {
  final String cityName;

  GetCityListEvent({required this.cityName});
}

abstract class CityState {}

class CityInitialState extends CityState {}

class CityLoadingState extends CityState {}

class CitySuccessState extends CityState {
  final List<City> cities;

  CitySuccessState({required this.cities});
}

class CityErrorState extends CityState {
  final String errorMessage;

  CityErrorState({required this.errorMessage});
}
