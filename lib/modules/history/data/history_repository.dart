import 'dart:math';

import 'package:lebs/models/history/history_course_model.dart';
import 'package:lebs/utils/random_utils.dart';

class HistoryRepository {
  ///[status]0：已取消；1：未开始；2：开始上课；3：正常结束；4：异常结束
  static Future<List<HistoryCourseModel>> getCourseList(
    DateTime startTime,
    DateTime endTime,
    int status,
  ) async {
    return Future.delayed(const Duration(seconds: 2), () {
      int length = Random().nextInt(20);
      List<HistoryCourseModel> courseList = List.empty(growable: true);
      for (int i = 0; i < length; i++) {
        List<DateTime> dt =
            RandomUtils.randomStartAndEndTime(startTime, endTime);
        courseList.add(
          HistoryCourseModel(
              classId: RandomUtils.generateId(),
              startTime: dt[0],
              endTime: dt[1],
              status: status == 4 ? 4 : RandomUtils.randomInt(5),
              subjectType: RandomUtils.randomInt(6),
              courseType: i == length - 1 ? 0 : 1,
              classTypeId: RandomUtils.randomInt(2) + 1,
              lessonDescription: "Level 88 Lesson $i"),
        );
      }

      courseList.sort((a, b) {
        //?
        if (a.startTime != null && b.startTime != null) {
          return a.startTime!.isAfter(b.startTime!) ? -1 : 0;
        } else {
          return 1;
        }
      });
      return courseList;
    });
  }
}
