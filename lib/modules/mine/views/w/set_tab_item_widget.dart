import 'package:flutter/material.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/modules/mine/controllers/mine_controller.dart';
import 'package:lebs/modules/mine/data/setting_tab_info.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/safe_gesture_detector.dart';

typedef SetTabClicked = void Function(int index, SettingTabInfo tabInfo);

class SetTabItemWidget extends StatelessWidget {
  final SettingTabInfo tabInfo;
  final int index;
  final SetTabClicked? onClicked;

  const SetTabItemWidget({
    Key? key,
    required this.tabInfo,
    required this.index,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeGestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.w(29), vertical: ScreenUtils.w(19)),
        decoration: BoxDecoration(
          color: MineController.to.selectedTabType == tabInfo.type
              ? Color(LeColor.c247580E5)
              : Colors.white,
          borderRadius: BorderRadius.circular(
            ScreenUtils.w(16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              tabInfo.icon,
              size: ScreenUtils.w(90),
              color: Colors.blue[400],
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtils.w(18)),
              height: ScreenUtils.w(90),
              alignment: Alignment.center,
              child: Text(
                tabInfo.title,
                style: TextStyle(
                  color: Color(LeColor.cff333333),
                  fontSize: ScreenUtils.f(32),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        if (onClicked != null) {
          onClicked!(index, tabInfo);
        }
      },
    );
  }
}
