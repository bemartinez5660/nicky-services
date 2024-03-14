import 'package:get/get.dart';
import 'package:cleanserv/pages/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WelcomeController(),
    );
  }
}
