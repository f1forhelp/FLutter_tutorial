import 'package:get_it/get_it.dart';

import 'controllers/screen1_controller.dart';

class AppInit {
  AppInit._();

  static GetIt getIt = GetIt.I;

  static initGetIt() {
    getIt.registerLazySingleton<Screen1Controller>(() => Screen1Controller());
  }

  static Future resetGetIt() async {
    await getIt.reset();
    initGetIt();
  }
}
