// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/city/city_use_cases.dart' as _i6;
import '../application/city/city_use_cases_impl.dart' as _i7;
import '../application/weather/weather_use_cases.dart' as _i4;
import '../application/weather/weather_use_cases_impl.dart' as _i5;
import '../infrastructure/gateway.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IGateWay>(() => _i3.GateWay());
    gh.lazySingleton<_i4.WeatherUseCases>(
        () => _i5.WeatherUseCasesImpl(gh<_i3.IGateWay>()));
    gh.lazySingleton<_i6.CityUseCases>(
        () => _i7.CityUseCasesImpl(gh<_i3.IGateWay>()));
    return this;
  }
}
