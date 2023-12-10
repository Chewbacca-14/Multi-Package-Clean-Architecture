import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/application/weather/weather_use_cases.dart';
import 'package:multi_package_clean_architecture/di/get_it_init.dart';
import 'package:multi_package_clean_architecture/presentation/bloc/city_bloc.dart';
import 'package:multi_package_clean_architecture/presentation/bloc/weather_bloc.dart';
import 'package:multi_package_clean_architecture/presentation/screens/home_page.dart';

void main() {
  configureDependencies(Environment.prod);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CityBloc>(
          create: (context) =>
              CityBloc(cityUseCases: injection<CityUseCases>()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            weatherUseCases: injection<WeatherUseCases>(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
