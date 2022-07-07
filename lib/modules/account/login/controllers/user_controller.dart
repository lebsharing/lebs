import 'package:get/get.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';
import 'package:lebs/modules/account/login/data/user_info_model.dart';
import 'package:lebs/modules/account/login/data/user_repository.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();

  final _parentInfo = Rx<ParentInfoModel>(ParentInfoModel());
  final _childList = List<ChildInfoModel>.empty(growable: true).obs;
  bool _init = false;
  @override
  void onInit() {
    super.onInit();
    _initUserInfo();
    print("----User onClose----$_init");
  }

  @override
  void onReady() {
    super.onReady();
    print("----User onClose----");
  }

  @override
  void onClose() {
    super.onClose();
    print("----User onClose----");
  }

  List<ChildInfoModel> get childList {
    return _childList;
  }

  bool isLogin() {
    return (_parentInfo.value.token?.isNotEmpty ?? false);
  }

  Future<bool> loginAndNext({String? email, String? pwd}) async {
    UserInfoModel userInfo = await userRepository.login();
    _updateUserInfo(userInfo);
    //跳转到下一页(关闭登录页面)
    Get.back();
    return true;
  }

  _initUserInfo() {
    UserInfoModel user = userRepository.getCacheParentInfo();
    _updateUserInfo(user);
    _init = true;
  }

  _updateUserInfo(UserInfoModel userInfo) {
    if (userInfo.parentInfo != null) {
      _parentInfo.value = userInfo.parentInfo!;
    }
    if (userInfo.childList != null) {
      _childList.value = userInfo.childList!;
    }
  }
}
