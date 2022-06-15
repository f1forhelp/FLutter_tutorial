import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Screen2Controller extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update();
  }

  void decrement() {
    counter--;
    update();
  }
}
