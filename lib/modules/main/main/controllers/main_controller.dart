import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find<MainController>();

  int selectIndex = 0;

  // int get selectIndex => _selectIndex.value;

  ///检查并切换tab。如果用户未登陆，则先跳转到登陆，登陆成功后，才可以切换tab
  void changeTab(int index) {
    selectIndex = index;
    update();
  }
}
