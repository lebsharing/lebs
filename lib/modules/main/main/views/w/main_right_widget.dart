import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../discover/views/discovery_page.dart';
import '../../../../history/views/history_page.dart';
import '../../../../home/views/home_page.dart';
import '../../../../mine/views/mine_page.dart';
import '../../../../schedule/views/schedule_page.dart';
import '../../controllers/main_controller.dart';

class MainRightWidget extends StatelessWidget {
  const MainRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: GetBuilder<MainController>(
        builder: (controller) {
          print("----index--");
          return IndexedStack(
            index: controller.selectIndex,
            children: const [
              HomePage(),
              SchedulePage(),
              HistoryPage(),
              DiscoveryPage(),
              MinePage(),
            ],
          );
        },
      ),
    );
  }
}
