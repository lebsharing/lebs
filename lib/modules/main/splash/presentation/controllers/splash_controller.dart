import 'package:get/get.dart';
import 'package:lebs/routes/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("----Splash onInit---");
  }

  @override
  void onReady() {
    super.onReady();
    print("-----------Splash Ready---");
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteName.mainPage);
    });
  }
}
