import 'package:get/get.dart';
import 'package:lebs/modules/main/main/controllers/main_controller.dart';

class MainBind extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
