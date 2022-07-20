import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/action_event_type.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/history/controllers/course_list_controller.dart';
import 'package:lebs/utils/event_bus_utils.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> tabs = [Intl.completedClasses, Intl.missedClasses];

  late TabController tabController;
  late DateTime startSelectedTime; //历史记录时间范围
  late DateTime endSelectedTime;

  static HistoryController get to => Get.find<HistoryController>();

  StreamSubscription? _busStreamSubscription;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
    _initTime();
    _initListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    _busStreamSubscription?.cancel();
    super.onClose();
  }

  updateTime(DateTime startTime, DateTime endTime) {
    startSelectedTime = startTime;
    endSelectedTime = endTime;
    update();
    _reloadData();
  }

  _initTime() {
    endSelectedTime = DateTime.now();
    startSelectedTime = endSelectedTime.subtract(const Duration(days: 30 * 3));
  }

  _reloadData() {
    CourseListController.to.loadData(startSelectedTime, endSelectedTime);
  }

  _initListener() {
    _busStreamSubscription = leEventBus.on<CommonEvent>().listen((event) {
      if (event.eventType == ActionEventType.changeAnotherChild) {
        /// 切换学生，历史课程数据重新刷新
        _initTime();
        _reloadData();
        update();
      }
    });
  }
}
