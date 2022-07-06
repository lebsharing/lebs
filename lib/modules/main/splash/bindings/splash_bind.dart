import 'package:get/get.dart';
import 'package:lebs/modules/main/splash/presentation/controllers/splash_controller.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    //注意两者的区别
    // Get.lazyPut<SplashController>(() => SplashController());
    Get.put<SplashController>(SplashController());
  }
}
