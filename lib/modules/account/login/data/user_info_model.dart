import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';

class UserInfoModel {
  ParentInfoModel? parentInfo;
  List<ChildInfoModel>? childList;

  UserInfoModel(this.parentInfo, this.childList);
}
