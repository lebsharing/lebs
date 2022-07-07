import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/modules/main/main/controllers/main_controller.dart';
import 'package:lebs/modules/main/main/data/main_config.dart';
import 'package:lebs/modules/main/main/views/w/nav_item.dart';

import '../../../../../utils/screen_utils.dart';

class LeftNavWidget extends StatelessWidget {
  const LeftNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.w(200),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: ScreenUtils.w(200),
            height: ScreenUtils.w(200),
            color: Colors.red,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: MainConfig.tabList.length,
              itemBuilder: (BuildContext context, int index) {
                TabConfig _config = MainConfig.tabList[index];
                return Obx(
                  () => NavItemWidget(
                    icon: _config.icon,
                    selectedIcon: _config.selectIcon,
                    name: _config.name,
                    selected: index == MainController.to.selectIndex,
                    margin: EdgeInsets.only(
                      top: ScreenUtils.r(30),
                      bottom: ScreenUtils.r(
                          index == MainConfig.tabList.length - 1 ? 60 : 30),
                    ),
                    index: index,
                    callback: (position) {
                      MainController.to.changeTab(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
