import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Screen1Controller extends GetxController {
  int counter = 0;

  @override
  void onInit() {
    print("----On Init Called");
    super.onInit();
  }

  @override
  void onReady() {
    print("----On Ready Called");
    super.onReady();
  }

  void increment() {
    counter++;
    update();
  }

  void decrement() {
    counter--;
    update();
  }
}
