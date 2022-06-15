import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tutorial/app_init.dart';
import 'package:flutter_tutorial/controllers/screen1_controller.dart';
import 'package:flutter_tutorial/views/Screen1.dart';
import 'package:flutter_tutorial/views/widge/custom_text_button.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import '../controllers/screen2_controller.dart';

class Screen2 extends StatelessWidget {
  Screen2({Key? key}) : super(key: key);

  final controller = Get.put(Screen2Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Screen2Controller>(
      // init: Screen2Controller(),
      initState: (state) {},
      builder: (controller) {
        return Material(
          child: Column(
            children: [
              Text('Screen2'),
              Text('Counter: ${controller.counter}'),
              CustomTextButton(
                label: "+",
                onPressed: () {
                  controller.increment();
                },
              ),
              CustomTextButton(
                  label: "-",
                  onPressed: () {
                    controller.decrement();
                  }),
              CustomTextButton(
                  label: "Go to Screen1",
                  onPressed: () {
                    Get.off(Screen1());
                  }),
              CustomTextButton(
                label: "Reset Screen 1 state",
                onPressed: () async {
                  // AppInit.resetGetIt();
                  // Get.deleteAll();
                  // Get.reset(clearRouteBindings: false);
                  // Get.find<Screen1Controller>().refresh();
                  // Get.snackbar("As", "as");
                  // await Get.delete<Screen1Controller>(force: true);
                  await Get.deleteAll(force: true);
                  Get.delete();
                  Get.showSnackbar(
                    GetSnackBar(
                      message: "Yhis is messahe",
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
