import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/constants.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/safe_gesture_detector.dart';

///主页左上角的抽屉
class LeftDrawerWidget extends StatelessWidget {
  const LeftDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<UserController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.childList.length + 1,
            itemBuilder: (ctx, index) {
              if (index == controller.childList.length) {
                ChildInfoModel addChildModel = ChildInfoModel(
                    childId: Constants.addChildAction,
                    name: Intl.addStudent.tr);
                return _DrawerItemWidget(
                    childInfo: addChildModel, index: index);
              }
              return _DrawerItemWidget(
                  childInfo: controller.childList[index], index: index);
            },
          );
        },
      ),
    );
  }
}

class _DrawerItemWidget extends StatelessWidget {
  final ChildInfoModel childInfo;
  final int index;
  const _DrawerItemWidget({
    Key? key,
    required this.childInfo,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeGestureDetector(
      onTap: () {
        onTap(context);
      },
      child: SizedBox(
        height: ScreenUtils.w(130),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: ScreenUtils.w(30),
                right: ScreenUtils.w(30),
              ),
              height: ScreenUtils.w(96),
              child: Stack(
                children: [
                  Container(
                    width: ScreenUtils.w(96),
                    height: ScreenUtils.w(96),
                    child: Image.asset(
                      childInfo.childId == Constants.addChildAction
                          ? "assets/images/main/add_child.png"
                          : "assets/images/main/child_default_avatar.png",
                      width: ScreenUtils.w(96),
                      height: ScreenUtils.w(96),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Visibility(
                      visible: childInfo.childId ==
                              UserController.to.curChild.childId &&
                          childInfo.childId != null,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/main/home_page_current_child.png",
                          width: ScreenUtils.w(38),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Text(
                childInfo.name ?? "",
                style: TextStyle(
                  color: Color(LeColor.cff333333),
                  fontSize: ScreenUtils.f(32),
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext ctx) {
    print("----Drawer click---$index");
    // Get.back();
    // Scaffold.of(context).po
    Navigator.of(ctx).pop();
    if (childInfo.childId == Constants.addChildAction) {
      //打开添加学生的页面
      Get.toNamed(RouteName.addChildPage);
      return;
    }
    UserController.to.updateCurChild(childInfo);
  }
}
