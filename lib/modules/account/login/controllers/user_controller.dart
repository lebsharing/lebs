import 'package:get/get.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';
import 'package:lebs/modules/account/login/data/user_info_model.dart';
import 'package:lebs/modules/account/login/data/user_repository.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();

  final _parentInfo = Rx<ParentInfoModel>(ParentInfoModel());
  final _childList = List<ChildInfoModel>.empty(growable: true).obs;

  ///当前选中的孩子
  final _curChild = ChildInfoModel().obs;

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

  ChildInfoModel get curChild {
    return _curChild.value;
  }

  ///设置当前选中的学生
  updateCurChild(ChildInfoModel childInfo) {
    _curChild.value = childInfo;
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

  Future<void> addChild(ChildInfoModel childInfo) async {
    _childList.add(childInfo);
    userRepository.addChildInfo(_childList);
  }

  Future<bool> logout() async {
    bool result = await userRepository.logout();
    if (result == true) {
      List<ChildInfoModel> list = List.empty(growable: true);
      UserInfoModel model = UserInfoModel(ParentInfoModel(), list);
      _updateUserInfo(model);
      return true;
    }
    return false;
  }

  _initUserInfo() {
    UserInfoModel user = userRepository.getCacheParentInfo();
    _updateUserInfo(user);
    _init = true;
  }

  //用于登录，获取本地缓存时更新数据。
  //退出登录时，更新本地数据
  _updateUserInfo(UserInfoModel userInfo) {
    if (userInfo.parentInfo != null) {
      _parentInfo.value = userInfo.parentInfo!;
    }
    if (userInfo.childList?.isNotEmpty ?? false) {
      _childList.value = userInfo.childList!;
      _curChild.value = userInfo.childList!.first;
    } else {
      _childList.clear();
      _curChild.value = ChildInfoModel();
    }
  }
}
