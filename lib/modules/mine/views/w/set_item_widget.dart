import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/common/le_application.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/modules/mine/data/set_item_info.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/safe_gesture_detector.dart';

typedef SetItemClicked = void Function(SetItemInfo info);

class SetItemWidget extends StatelessWidget {
  final SetItemInfo itemInfo;
  final SetItemClicked? onClicked;
  const SetItemWidget({
    Key? key,
    required this.itemInfo,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: ScreenUtils.w(30)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtils.w(36)),
      height: ScreenUtils.w(129),
      child: SafeGestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    itemInfo.titleKey.tr,
                    style: TextStyle(
                      color: Color(LeColor.cff333333),
                      fontSize: ScreenUtils.f(32),
                    ),
                  ),
                  //label
                  Visibility(
                    visible: itemInfo.type == SetItemType.version,
                    child: Container(
                      margin: EdgeInsets.only(left: ScreenUtils.w(13)),
                      width: ScreenUtils.w(14),
                      height: ScreenUtils.w(14),
                      decoration: BoxDecoration(
                          color: Color(LeColor.cFFCB4428),
                          borderRadius:
                              BorderRadius.circular(ScreenUtils.w(14))),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: itemInfo.type == SetItemType.language,
                  child: Text(
                    LeApplication.isZh() ? "中文" : "English",
                    style: TextStyle(
                      color: Color(LeColor.cFF666666),
                      fontSize: ScreenUtils.f(28),
                    ),
                  ),
                ),
                Text(
                  itemInfo.value,
                  style: TextStyle(
                    color: Color(LeColor.cFF666666),
                    fontSize: ScreenUtils.f(28),
                  ),
                ),
                Visibility(
                  visible: itemInfo.type != SetItemType.version,
                  child: Icon(
                    Icons.navigate_next,
                    size: ScreenUtils.w(60),
                  ),
                ),
              ],
            )
          ],
        ),
        onTap: () {
          if (onClicked != null) {
            onClicked!(itemInfo);
          }
        },
      ),
    );
  }
}
