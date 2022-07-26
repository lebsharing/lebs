import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/mine/controllers/setting_controller.dart';
import 'package:lebs/modules/mine/data/set_item_info.dart';
import 'package:lebs/modules/mine/views/w/select_language.dart';
import 'package:lebs/modules/mine/views/w/set_item_widget.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/utils/screen_utils.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<SettingController>(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intl.setting.tr,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: GetBuilder<SettingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.itemList.length,
                  itemBuilder: (ctx, index) {
                    return SetItemWidget(
                      itemInfo: controller.itemList[index],
                      onClicked: _setItemClicked,
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.maxFinite,
            height: ScreenUtils.w(108),
            margin: EdgeInsets.only(
              left: ScreenUtils.w(60),
              right: ScreenUtils.w(60),
              top: ScreenUtils.w(40),
              bottom: ScreenUtils.w(80),
            ),
            child: TextButton(
              onPressed: () {
                _signOut(context);
              },
              child: Text(
                Intl.signOut.tr,
                style: TextStyle(
                    color: Color(LeColor.cff7580E5),
                    fontSize: ScreenUtils.f(36)),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ScreenUtils.w(54),
                  ),
                  side: BorderSide(
                    color: Color(LeColor.cff7580E5),
                    width: ScreenUtils.w(3),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _setItemClicked(SetItemInfo info) {
    if (info.type == SetItemType.language) {
      Get.dialog(const Dialog(
        child: SelectLanguageWidget(),
      ));
    } else if (info.type == SetItemType.recording) {
    } else if (info.type == SetItemType.version) {
    } else if (info.type == SetItemType.conditions) {
    } else if (info.type == SetItemType.deleteAccount) {}
  }

  void _signOut(BuildContext context) async {
    bool result = await UserController.to.logout();
    if (result) {
      Get.back();
      Get.offAllNamed(RouteName.mainPage);
      // leEventBus.fire(CommonEvent(ActionEventType.signOut));
    }
  }
}
