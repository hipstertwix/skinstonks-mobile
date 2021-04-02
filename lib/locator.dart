import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService(FlutterSecureStorage()));
  locator.registerLazySingleton(() => NavigationService());
}
