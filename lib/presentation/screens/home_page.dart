import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_package_clean_architecture/presentation/bloc/city_bloc.dart';
import 'package:multi_package_clean_architecture/presentation/bloc/weather_bloc.dart';
import 'package:multi_package_clean_architecture/utils/api_call_debouncer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Debouncer _debouncer = Debouncer(delay: const Duration(seconds: 2));
  final TextEditingController _searchController = TextEditingController();
  String selectedCityName = '';
  @override
  Widget build(BuildContext context) {
    CityBloc cityBloc = BlocProvider.of<CityBloc>(context);
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: TextField(
              controller: _searchController,
              onChanged: (city) async {
                city != ''
                    ? _debouncer.run(() {
                        cityBloc.add(
                          GetCityListEvent(cityName: city),
                        );
                      })
                    : null;
              },
            ),
          ),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is CityInitialState) {
                return const Column(
                  children: [
                    Center(
                      child: Text('Please, find a city'),
                    ),
                  ],
                );
              } else if (state is CityLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (state is CityErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is CitySuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 200,
                      child: ListView.builder(
                          itemCount: state.cities.length,
                          itemBuilder: (context, index) {
                            var city = state.cities[index];
                            return GestureDetector(
                              onTap: () {
                                weatherBloc
                                    .add(GetWEatherEvent(cityName: city.name));
                              },
                              child: Center(
                                child: Text(
                                  city.name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherInitialState) {
            } else if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            } else if (state is WeatherSuccessState) {
              return Center(
                child: Column(
                  children: [
                    Text('Temp: ${state.weather.temp}'),
                    Text('Feels Like: ${state.weather.feelsLike}'),
                  ],
                ),
              );
            }
            return const SizedBox();
          })
        ],
      ),
    );
  }
}
