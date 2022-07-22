import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_status.dart';
import 'package:lebs/modules/history/data/homework_repository.dart';

import '../../../models/history/homework_content.dart';

class HomeworkMixController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HomeworkMixController get to => Get.find<HomeworkMixController>();

  RxList<HomeworkContent> homeworkList = <HomeworkContent>[].obs;
  final status = DataStatus.unload.obs;
  TabController? _tabController;
  // final tabController = TabController(length: 0, vsync: this)

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {}

  loadData() async {
    status.value = DataStatus.loading;
    List<HomeworkContent> list = await HomeworkRepository.getHomework();
    homeworkList.clear();
    homeworkList.addAll(list);
    status.value = DataStatus.finish;
  }

  TabController get tabController => _tabController ??=
      TabController(length: homeworkList.length, vsync: this);
}
