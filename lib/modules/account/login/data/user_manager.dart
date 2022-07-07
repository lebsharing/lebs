import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';

@deprecated
class UserManager {
  static UserManager? _instance;
  UserManager._internal();

  static UserManager get instance {
    _instance ??= UserManager._internal();
    return _instance!;
  }

  ParentInfoModel? _parentInfo;
  List<ChildInfoModel>? _childList;

  set userInfo(ParentInfoModel info) => _parentInfo = info;

  set childList(List<ChildInfoModel> childList) => _childList = childList;

  List<ChildInfoModel> get childList {
    return _childList ?? List.empty();
  }

  bool isLogin() {
    return (_parentInfo?.token?.isNotEmpty ?? false);
  }
}
