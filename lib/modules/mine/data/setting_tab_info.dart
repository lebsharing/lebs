import 'package:flutter/material.dart';

enum SettingTabType {
  account,
  addClass,
  coupon,
  order,
  faq,
  feedback,
  setting,
  itTest,
}

class SettingTabInfo {
  String title;
  IconData icon;
  SettingTabType type;

  SettingTabInfo(this.title, this.icon, this.type);
}
