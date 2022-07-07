import 'package:flutter/material.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/safe_gesture_detector.dart';

class NavItemWidget extends StatelessWidget {
  final String icon;
  final String? selectedIcon;
  final String name;
  final bool selected;
  final EdgeInsets? margin;
  final int index;
  final Function(int index)? callback;

  const NavItemWidget({
    Key? key,
    required this.icon,
    this.selectedIcon,
    required this.name,
    this.selected = false,
    this.margin,
    required this.index,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SafeGestureDetector(
        onTap: () {
          if (callback != null) {
            callback!(index);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              selected && selectedIcon != null ? selectedIcon! : icon,
              width: ScreenUtils.w(96),
              height: ScreenUtils.w(96),
              fit: BoxFit.cover,
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(LeColor.cff7580E5),
                fontSize: ScreenUtils.f(28),
              ),
            )
          ],
        ),
      ),
    );
  }
}
