import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tutorial/views/screen2.dart';
import 'package:flutter_tutorial/views/widge/custom_text_button.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

import '../controllers/screen1_controller.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key? key}) : super(key: key);

  final controller = Get.put(Screen1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Screen1Controller>(
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen1'),
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
                  label: "Go to Screen2",
                  onPressed: () {
                    Get.off(Screen2());
                  }),
            ],
          ),
        );
      },
    );
  }
}
