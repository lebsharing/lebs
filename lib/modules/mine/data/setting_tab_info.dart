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
  String titleKey;
  IconData icon;
  SettingTabType type;

  SettingTabInfo(this.titleKey, this.icon, this.type);
}
