//import 'package:SmartDeviceDart/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
//import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

//@injectableInit
//Future<void> configureInjection(String environment) async =>
//    await $initGetIt(getIt, environment: environment);

abstract class Env {
  static const String test = 'test';
  static const String dev_pc = 'dev_pc';
  static const String dev_pi = 'dev_pi';
  static const String prod = 'prod';
}
