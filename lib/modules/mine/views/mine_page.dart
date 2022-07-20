import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/mine/controllers/mine_controller.dart';
import 'package:lebs/modules/mine/data/setting_tab_info.dart';
import 'package:lebs/modules/mine/views/account_page.dart';
import 'package:lebs/modules/mine/views/coupon_page.dart';
import 'package:lebs/modules/mine/views/order_page.dart';
import 'package:lebs/modules/mine/views/setting_page.dart';
import 'package:lebs/modules/mine/views/w/set_tab_item_widget.dart';
import 'package:lebs/modules/web/browser_page.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/my_behavior.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MineController());
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: ScreenUtils.w(440),
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: ScreenUtils.w(48),
                  right: ScreenUtils.w(48),
                  top: ScreenUtils.w(108)),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: GetBuilder<MineController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.tabList.length,
                      itemBuilder: (ctx, index) {
                        return SetTabItemWidget(
                          tabInfo: controller.tabList[index],
                          index: index,
                          onClicked: _onTabClicked,
                        );
                      },
                      shrinkWrap: true,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(LeColor.cFFF4F4F4),
                child: GetBuilder<MineController>(
                  builder: (controller) {
                    return _generateTabPage(controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabClicked(int index, SettingTabInfo tabInfo) {
    if (tabInfo.type == SettingTabType.itTest) {
      Get.toNamed(RouteName.itTestPage);
    } else {
      MineController.to.updateSelectedTabType(tabInfo.type);
    }
  }

  Widget _generateTabPage(MineController controller) {
    switch (controller.selectedTabType) {
      case SettingTabType.account:
        return const AccountPage();
      case SettingTabType.coupon:
        return const CouponPage();
      case SettingTabType.order:
        return const OrderPage();
      case SettingTabType.faq:
        return BrowserPage(
          url: controller.faqUrl,
          title: Intl.faq.tr,
        );
      case SettingTabType.feedback:
        return BrowserPage(
          url: controller.feedbackUrl,
          title: Intl.feedback.tr,
        );
      case SettingTabType.setting:
        return const SettingPage();
      default:
        return const Center(
          child: Text("undefine"),
        );
    }
  }
}
