import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';

class CityBloc extends Bloc<CityEvents, CityState> {
  final CityUseCases cityUseCases;
  CityBloc({required this.cityUseCases}) : super(CityInitialState()) {
    on<GetCityListEvent>((event, emit) async {
      emit(CityLoadingState());
      try {
        List<City> cities = await cityUseCases.getCityList(event.cityName);
        emit(CitySuccessState(cities: cities));
      } catch (e) {
        emit(
          CityErrorState(errorMessage: 'Failed to get cities: ${e.toString()}'),
        );
      }
    });
  }
}

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
