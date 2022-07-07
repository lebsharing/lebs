import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/main/main/views/w/nav_item.dart';
import 'package:lebs/utils/screen_utils.dart';

class TopConnerWidget extends StatelessWidget {
  const TopConnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtils.w(140),
        bottom: ScreenUtils.w(30),
      ),
      child: Obx(
        () => NavItemWidget(
          icon: UserController.to.isLogin() &&
                  UserController.to.childList.isNotEmpty
              ? "assets/images/main/child_default_avatar.png"
              : "assets/images/main/add_child.png",
          name: UserController.to.isLogin() &&
                  UserController.to.childList.isNotEmpty
              ? (UserController.to.curChild.name ?? "")
              : "",
          index: 0,
          callback: (position) {
            if (UserController.to.isLogin() &&
                UserController.to.childList.isNotEmpty) {
            } else {}
          },
        ),
      ),
    );
  }
}
