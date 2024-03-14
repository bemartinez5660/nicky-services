// import 'package:cleanserv/services/authService.dart';
import 'package:get/get.dart';
import 'package:cleanserv/pages/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterController(),
    );
  }
}
