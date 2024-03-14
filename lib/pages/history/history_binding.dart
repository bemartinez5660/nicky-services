import 'package:get/get.dart';
import 'package:cleanserv/pages/history/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HistoryController(),
    );
  }
}
