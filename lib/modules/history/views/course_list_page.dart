import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_status.dart';
import 'package:lebs/models/history/history_course_model.dart';
import 'package:lebs/modules/history/controllers/course_list_controller.dart';
import 'package:lebs/modules/history/controllers/history_controller.dart';
import 'package:lebs/modules/history/views/w/course_item_widget.dart';
import 'package:lebs/widgets/loading_status_widget.dart';

class CourseListPage extends StatelessWidget {
  final int status;

  const CourseListPage({Key? key, required this.status}) : super(key: key);

  // CourseListPage({Key? key, required this.status}) : super(key: key) {
  //   Get.put<CourseListController>(CourseListController(status));
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseListController>(
      init: CourseListController(status)
        ..loadData(HistoryController.to.startSelectedTime,
            HistoryController.to.endSelectedTime),
      builder: (controller) {
        if (controller.dataStatus == DataStatus.unload ||
            controller.dataStatus == DataStatus.loading) {
          return const LoadingWidget();
        } else if (controller.dataStatus == DataStatus.error) {
          return const LoadErrorWidget();
        } else {
          if (controller.courseList.isNotEmpty) {
            return ListView.builder(
                itemCount: controller.courseList.length,
                itemBuilder: (ctx, index) {
                  HistoryCourseModel model = controller.courseList[index];
                  return CourseItemWidget(courseModel: model);
                });
          } else {
            return const NoDataWidget();
          }
        }
      },
    );
  }
}
