import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> tabs = [Intl.completedClasses, Intl.missedClasses];

  late TabController tabController;
  late DateTime startSelectedTime; //历史记录时间范围
  late DateTime endSelectedTime;

  static HistoryController get to => Get.find<HistoryController>();

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
    endSelectedTime = DateTime.now();
    startSelectedTime = endSelectedTime.subtract(const Duration(days: 30 * 3));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
