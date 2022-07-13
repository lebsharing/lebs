import 'package:get/get.dart';
import 'package:lebs/modules/history/controllers/history_controller.dart';

class HistoryBind extends Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController());
  }
}
