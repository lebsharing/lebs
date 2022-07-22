import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/constants/le_status.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/history/controllers/homework_mix_controller.dart';
import 'package:lebs/modules/history/views/online_homework_page.dart';
import 'package:lebs/modules/history/views/pdf_homework_page.dart';
import 'package:lebs/utils/screen_utils.dart';

class HomeworkMixPage extends StatelessWidget {
  const HomeworkMixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put<HomeworkMixPage>(const HomeworkMixPage());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intl.assignment.tr,
        ),
      ),
      body: GetX<HomeworkMixController>(
          init: HomeworkMixController(),
          builder: (controller) {
            if (controller.status.value == DataStatus.unload ||
                controller.status.value == DataStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                TabBar(
                  unselectedLabelStyle: TextStyle(
                    color: Color(LeColor.cFF999999),
                    fontSize: ScreenUtils.f(36),
                    fontWeight: FontWeight.w500,
                  ),
                  controller: controller.tabController,
                  labelStyle: TextStyle(
                    color: Color(LeColor.cff7580E5),
                    fontSize: ScreenUtils.f(36),
                    fontWeight: FontWeight.w500,
                  ),
                  labelColor: Color(LeColor.cff7580E5),
                  unselectedLabelColor: Color(LeColor.cFF999999),
                  indicatorWeight: 3.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: controller.homeworkList
                      .map((element) => Tab(
                            text: element.tabName,
                          ))
                      .toList(),
                  onTap: (index) {},
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: controller.homeworkList.map((h) {
                      //1-pdf作业 2-在线作业 3-unit作业
                      if (h.homeworkType == 1) {
                        return PdfHomeworkPage(
                          pdfHomework: h,
                        );
                      } else if (h.homeworkType == 2) {
                        return const OnlineHomeworkPage();
                      } else if (h.homeworkType == 3) {
                        return const OnlineHomeworkPage();
                      } else {
                        return const Center(
                          child: Text("TODO"),
                        );
                      }
                    }).toList(),
                  ),
                )
              ],
            );
          }),
    );
  }
}
