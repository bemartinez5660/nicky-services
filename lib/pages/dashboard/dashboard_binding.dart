import 'package:cleanserv/pages/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(
          // ctrlGlobal: Get.find<GlobalController>(),
          ),
    );
  }
}
