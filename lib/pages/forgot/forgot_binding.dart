import 'package:get/get.dart';
import 'package:cleanserv/pages/forgot/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ForgotController(),
    );
  }
}
