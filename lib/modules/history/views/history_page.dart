import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/history/controllers/history_controller.dart';
import 'package:lebs/modules/history/views/course_list_page.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/outline_btn.dart';

///历史课程
class HistoryPage extends StatelessWidget {
  // fianl  _controller = Get.put<HistoryController>(HistoryController());
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Intl.history.tr,
          style: TextStyle(
            color: Color(LeColor.cff333333),
            // fontSize: ScreenUtils.f(30),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<HistoryController>(
        init: HistoryController(),
        builder: (controller) {
          return Column(
            children: [
              ///TabBar
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    OutlineBtn(
                      height: ScreenUtils.w(66),
                      padding:
                          EdgeInsets.symmetric(horizontal: ScreenUtils.w(40)),
                      margin: EdgeInsets.only(left: ScreenUtils.w(40)),
                      borderRadius: ScreenUtils.w(40),
                      text: "近三个月",
                      onClicked: () {},
                    ),
                    Expanded(
                      child: TabBar(
                        onTap: (index) {},
                        controller: controller.tabController,
                        labelStyle: TextStyle(
                          color: Color(LeColor.cff333333),
                          fontSize: ScreenUtils.f(36),
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Color(LeColor.cFF999999),
                          fontSize: ScreenUtils.f(36),
                          fontWeight: FontWeight.w500,
                        ),
                        indicatorColor: Color(LeColor.cff7580E5),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3.0,
                        labelColor: Color(LeColor.cff333333),
                        unselectedLabelColor: Color(LeColor.cFF999999),
                        tabs: controller.tabs
                            .map((e) => Tab(
                                  text: e.tr,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              ///course list
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CourseListPage(status: 0),
                    CourseListPage(
                      status: 5,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
