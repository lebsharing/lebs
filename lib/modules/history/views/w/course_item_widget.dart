import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/constants.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/models/history/history_course_model.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/utils/date_time_utils.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/outline_btn.dart';

class CourseItemWidget extends StatelessWidget {
  final HistoryCourseModel courseModel;
  const CourseItemWidget({
    Key? key,
    required this.courseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.w(15)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(LeColor.c17B6B6B6),
            offset: Offset(0, ScreenUtils.w(4)),
            spreadRadius: ScreenUtils.w(6),
            blurRadius: ScreenUtils.w(12))
      ], borderRadius: BorderRadius.circular(ScreenUtils.w(10))),
      padding: EdgeInsets.only(
        left: ScreenUtils.w(45),
        right: ScreenUtils.w(45),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
              top: ScreenUtils.w(43),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: ScreenUtils.w(10), left: ScreenUtils.w(27)),
                  child: Row(
                    children: [
                      Text(
                        DateTimeUtils.monthDayWeekClassTime(
                            courseModel.startTime, courseModel.endTime),
                        style: TextStyle(
                          color: Color(LeColor.cff333333),
                          fontSize: ScreenUtils.f(32),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtils.w(27),
                          bottom: ScreenUtils.w(10),
                        ),
                        child: Row(
                          children: const [
                            Text("label"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtils.w(50),
                  margin: EdgeInsets.only(
                      bottom: ScreenUtils.w(35), left: ScreenUtils.w(27)),
                  child: Row(
                    children: [
                      Visibility(
                        visible:
                            courseModel.courseType == Constants.trialCourse,
                        child: Padding(
                          padding: EdgeInsets.only(right: ScreenUtils.w(7)),
                          child: Image.asset(
                            "assets/images/history/trial.png",
                            height: ScreenUtils.w(32),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            courseModel.classTypeId == Constants.classType1V1,
                        child: Padding(
                          padding: EdgeInsets.only(right: ScreenUtils.w(7)),
                          child: Image.asset(
                            "assets/images/history/group.png",
                            height: ScreenUtils.w(32),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(
                            ScreenUtils.w(12),
                          ),
                        ),
                        margin: EdgeInsets.only(right: ScreenUtils.w(7)),
                        child: Text(
                          courseModel.getSubjectName(),
                          style: TextStyle(
                            color: const Color(0xFF999999),
                            fontSize: ScreenUtils.w(20),
                          ),
                        ),
                      ),
                      Text(
                        "${courseModel.lessonDescription}",
                        style: TextStyle(
                            color: Color(LeColor.cFF666666),
                            fontSize: ScreenUtils.f(28)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: ScreenUtils.w(20),
                    left: ScreenUtils.w(27),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/history/ava.png",
                              width: ScreenUtils.w(64),
                              height: ScreenUtils.w(64),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: ScreenUtils.w(7)),
                              child: Text(
                                "what is name | ${UserController.to.curChild.name}",
                                style: TextStyle(
                                  color: Color(LeColor.cFF666666),
                                  fontSize: ScreenUtils.f(28),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Opacity(
                        opacity:
                            courseModel.status != Constants.classStatusAbnormal
                                ? 0.3
                                : 1,
                        child: OutlineBtn(
                          text: Intl.preview.tr,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtils.w(32),
                              vertical: ScreenUtils.w(12)),
                          margin: EdgeInsets.only(right: ScreenUtils.w(20)),
                          borderRadius: ScreenUtils.w(44),
                          fontSize: ScreenUtils.f(24),
                          onClicked: () {},
                        ),
                      ),
                      Visibility(
                        visible:
                            courseModel.courseType != Constants.trialCourse,
                        child: Opacity(
                          opacity: 1,
                          child: OutlineBtn(
                            text: Intl.classSummary.tr,
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtils.w(32),
                                vertical: ScreenUtils.w(12)),
                            margin: EdgeInsets.only(right: ScreenUtils.w(20)),
                            borderRadius: ScreenUtils.w(44),
                            fontSize: ScreenUtils.f(24),
                            onClicked: () {
                              _jumpClassSummary(context);
                            },
                          ),
                        ),
                      ),
                      OutlineBtn(
                        text: Intl.review.tr,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtils.w(32),
                            vertical: ScreenUtils.w(12)),
                        margin: EdgeInsets.only(right: ScreenUtils.w(20)),
                        borderRadius: ScreenUtils.w(44),
                        fontSize: ScreenUtils.f(24),
                        onClicked: () {},
                      ),
                      OutlineBtn(
                        text: Intl.playback.tr,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtils.w(32),
                            vertical: ScreenUtils.w(12)),
                        margin: EdgeInsets.only(right: ScreenUtils.w(20)),
                        borderRadius: ScreenUtils.w(44),
                        fontSize: ScreenUtils.f(24),
                        onClicked: () {},
                      ),
                      OutlineBtn(
                        text: Intl.assignment.tr,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtils.w(32),
                            vertical: ScreenUtils.w(12)),
                        margin: EdgeInsets.only(right: ScreenUtils.w(20)),
                        borderRadius: ScreenUtils.w(44),
                        fontSize: ScreenUtils.f(24),
                        onClicked: () {
                          Get.toNamed(RouteName.homeworkPage);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          ///label
        ],
      ),
    );
  }

  _jumpClassSummary(BuildContext context) {
    String url = "https://flutter.dev";
    String url1 = "https://www.baidu.com/";
    Get.toNamed(RouteName.browserPage,
        arguments: {"url": url, "title": "Class Summary"});
  }
}
