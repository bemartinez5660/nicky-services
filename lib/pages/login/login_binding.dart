// import 'package:cleanserv/services/authService.dart';
import 'package:get/get.dart';
import 'package:cleanserv/pages/login/login_controller.dart';
// import 'package:cleanserv/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
          // ctrlGlobal: Get.find<GlobalController>(),
          ),
    );
    // Get.lazyPut(
    //   () => AuthService(),
    // );
  }
}
