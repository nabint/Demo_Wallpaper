import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/viewmodels/basemodel.dart';
import 'core/viewmodels/detailmodel.dart';
import 'core/viewmodels/homemodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => BaseModel());
  locator.registerFactory(() => DetailModel());
}
