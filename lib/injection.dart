import 'package:cbj_smart_device/injection.config.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// Saves the current environment for manual use
late String currentEnv;

@injectableInit
Future<void> configureInjection(String environment) async {
  currentEnv = environment;
  logger.i('Current CyBear Jinni Hub environment name: $currentEnv');
  $initGetIt(getIt, environment: environment);
}

abstract class Env {
  static const String test = 'test';
  static const String devPc = 'dev_pc';
  static const String devPi = 'dev_pi';
  static const String prod = 'prod';
}
