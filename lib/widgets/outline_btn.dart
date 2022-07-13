import 'package:flutter/material.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/widgets/safe_gesture_detector.dart';

///带有描边的按钮
class OutlineBtn extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String text;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final VoidCallback? onClicked;
  const OutlineBtn({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    required this.text,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.fontColor,
    this.fontSize,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeGestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked!();
        }
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            borderRadius ?? ScreenUtils.w(25),
          ),
          border: Border.all(
            color: borderColor ?? Color(LeColor.cff7580E5),
            width: borderWidth ?? 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: fontColor ?? Color(LeColor.cff7580E5),
            fontSize: fontSize ?? ScreenUtils.f(26),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
