import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_package_clean_architecture/di/get_it_init.config.dart';

final injection = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
GetIt configureDependencies(String environment) =>
    injection.init(environment: environment);
