import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/mine/data/set_item_info.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find<SettingController>();

  List<SetItemInfo> itemList = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    itemList.add(SetItemInfo(Intl.language, "", SetItemType.language));
    itemList.add(SetItemInfo(Intl.recording, "OFF", SetItemType.recording));
    itemList.add(SetItemInfo(Intl.version, "1.0.0", SetItemType.version));
    itemList.add(SetItemInfo(Intl.conditions, "", SetItemType.conditions));
    itemList
        .add(SetItemInfo(Intl.deleteAccount, "", SetItemType.deleteAccount));
  }
}
