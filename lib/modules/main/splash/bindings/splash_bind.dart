import 'package:get/get.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/main/splash/presentation/controllers/splash_controller.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    //注意两者的区别
    // Get.lazyPut<SplashController>(() => SplashController());
    Get.put<SplashController>(SplashController());
    Get.put<UserController>(UserController(), permanent: true);
  }
}
