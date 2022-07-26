import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/mine/data/setting_tab_info.dart';

class MineController extends GetxController {
  static MineController get to => Get.find<MineController>();

  List<SettingTabInfo> tabList = List.empty(growable: true);
  SettingTabType selectedTabType = SettingTabType.account;
  String faqUrl = "https://flutter.dev/";
  String feedbackUrl = "https://dart.dev/";

  @override
  void onInit() {
    super.onInit();
    _initSetTabData();
  }

  void updateSelectedTabType(SettingTabType tabType) {
    selectedTabType = tabType;
    update();
  }

  _initSetTabData() {
    tabList.add(SettingTabInfo(
        Intl.account, Icons.account_box_outlined, SettingTabType.account));
    tabList.add(SettingTabInfo(
        Intl.addClasses, Icons.payment_outlined, SettingTabType.addClass));
    tabList.add(SettingTabInfo(
        Intl.coupon, Icons.card_giftcard_outlined, SettingTabType.coupon));
    tabList
        .add(SettingTabInfo(Intl.order, Icons.reorder, SettingTabType.order));
    tabList.add(SettingTabInfo(
        Intl.faq, Icons.question_answer_outlined, SettingTabType.faq));
    tabList.add(SettingTabInfo(
        Intl.feedback, Icons.feedback_outlined, SettingTabType.feedback));
    tabList.add(SettingTabInfo(
        Intl.setting, Icons.settings_outlined, SettingTabType.setting));
    tabList.add(SettingTabInfo(
        Intl.itTest, Icons.devices_other_outlined, SettingTabType.itTest));
  }
}
