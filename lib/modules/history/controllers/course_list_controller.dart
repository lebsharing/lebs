import 'package:get/get.dart';
import 'package:lebs/modules/history/data/history_repository.dart';

import '../../../constants/le_status.dart';
import '../../../models/history/history_course_model.dart';

class CourseListController extends GetxController {
  int status;
  List<HistoryCourseModel> courseList = List.empty(growable: true);
  DataStatus dataStatus = DataStatus.unload;

  CourseListController(this.status);

  @override
  void onReady() {
    super.onReady();
  }

  loadData(DateTime startTime, DateTime endTime) async {
    dataStatus = DataStatus.loading;
    update();
    List<HistoryCourseModel> list =
        await HistoryRepository.getCourseList(startTime, endTime, status);
    courseList.clear();
    courseList.addAll(list);
    dataStatus = DataStatus.finish;
    update();
  }
}
