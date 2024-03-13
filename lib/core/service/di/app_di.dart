import 'package:get_it/get_it.dart';

class AppDi {
  static final AppDi _obj = AppDi._inaternal();
  factory AppDi() => _obj;
  AppDi._inaternal();

  late GetIt di;

  init() {
    _authentication();
  }

  _authentication() {}
}
