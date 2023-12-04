import 'package:flutter/material.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases.dart';
import 'package:multi_package_clean_architecture/application/city/city_use_cases_impl.dart';
import 'package:multi_package_clean_architecture/domain/city.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<City> cities = [];
  CityUseCases _cityUseCases = CityUseCasesImpl();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: TextField(
            controller: _searchController,
            onChanged: (value) async {
              var citiesList = await _cityUseCases.getCityList(value);
              setState(() {
                cities = citiesList;
              });
            },
          ),
        ),
        SizedBox(
          height: 300,
          width: 200,
          child: ListView.builder(
              itemCount: cities.isEmpty ? 0 : cities.length,
              itemBuilder: (context, index) {
                var city = cities[index];
                return Text(
                  city.name,
                  style: TextStyle(color: Colors.black),
                );
              }),
        )
      ],
    ));
  }
}
