import 'package:cleanserv/pages/stepper/stepper_controller.dart';
import 'package:get/get.dart';
// import 'package:cleanserv/pages/welcome/welcome_controller.dart';

class StepperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StepperController(),
    );
  }
}
