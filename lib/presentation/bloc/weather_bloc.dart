import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_package_clean_architecture/application/weather/weather_use_cases.dart';
import 'package:multi_package_clean_architecture/domain/weather.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  final WeatherUseCases weatherUseCases;
  WeatherBloc({required this.weatherUseCases}) : super(WeatherInitialState()) {
    on<GetWEatherEvent>((event, emit) async {
      log('get city');
      emit(WeatherLoadingState());
      try {
        Weather weather = await weatherUseCases.getWeather(event.cityName);
        emit(WeatherSuccessState(weather: weather));
        log('${weather.feelsLike}');
      } catch (e) {
        emit(
          WeatherErrorState(
              errorMessage: 'Failed to get weather: ${e.toString()}'),
        );
      }
    });
  }
}

abstract class WeatherEvents {}

class GetWEatherEvent extends WeatherEvents {
  final String cityName;

  GetWEatherEvent({required this.cityName});
}

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final Weather weather;

  WeatherSuccessState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}
