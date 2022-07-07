import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/main/main/controllers/main_controller.dart';
import 'package:lebs/modules/main/main/views/w/left_nav_widget.dart';
import 'package:lebs/modules/main/main/views/w/main_right_widget.dart';
import 'package:lebs/modules/main/main/views/w/nav_item.dart';
import 'package:lebs/modules/main/main/views/w/top_conner_widget.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/utils/screen_utils.dart';

import '../../../discover/views/discovery_page.dart';
import '../../../history/views/history_page.dart';
import '../../../home/views/home_page.dart';
import '../../../mine/views/mine_page.dart';
import '../../../schedule/views/schedule_page.dart';
import '../data/main_config.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GetBuilder<MainController>(builder: (controller) {
        return Scaffold(
          body: Row(
            children: [
              Container(
                width: ScreenUtils.w(200),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TopConnerWidget(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: MainConfig.tabList.length,
                        itemBuilder: (BuildContext context, int index) {
                          TabConfig _config = MainConfig.tabList[index];
                          return NavItemWidget(
                            icon: _config.icon,
                            selectedIcon: _config.selectIcon,
                            name: _config.name.tr,
                            selected: index == controller.selectIndex,
                            margin: EdgeInsets.only(
                              top: ScreenUtils.r(30),
                              bottom: ScreenUtils.r(
                                  index == MainConfig.tabList.length - 1
                                      ? 60
                                      : 30),
                            ),
                            index: index,
                            callback: (position) {
                              if (!UserController.to.isLogin() &&
                                  position > 0) {
                                Get.toNamed(RouteName.loginPage);
                              } else {
                                MainController.to.changeTab(index);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(LeColor.c80D8D8D8),
                width: ScreenUtils.w(2),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: IndexedStack(
                    index: controller.selectIndex,
                    children: const [
                      HomePage(),
                      SchedulePage(),
                      HistoryPage(),
                      DiscoveryPage(),
                      MinePage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

///TODO STUDY 为什么这种方案不行？
class MainPage2 extends StatelessWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Row(
          children: [
            const LeftNavWidget(),
            Container(
              color: Color(LeColor.c80D8D8D8),
              width: ScreenUtils.w(2),
            ),
            const Expanded(
              child: MainRightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
