import 'dart:convert';

import 'package:lebs/constants/sp_const.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';
import 'package:lebs/modules/account/login/data/user_info_model.dart';
import 'package:lebs/net/api/user_service.dart';
import 'package:lebs/utils/sp_utils.dart';

final userRepository = UserRepository();

class UserRepository {
  static UserRepository? _instance;

  UserRepository._internal();

  //工厂构造函数
  factory UserRepository() {
    _instance ??= UserRepository._internal();
    return _instance!;
  }

  Future<UserInfoModel> login() async {
    //模拟网络请求
    ParentInfoModel parent = await UserService.login();
    List<ChildInfoModel> childList = await UserService.requestChildList();
    //将数据存储到本地
    String parentJsonStr = json.encode(parent);
    String childListStr = json.encode(childList);
    print("parent:$parentJsonStr");
    print("childList:$childListStr");
    SpUtils.instance.putString(SpConst.parentInfo, parentJsonStr);
    SpUtils.instance.putString(SpConst.childList, childListStr);
    return UserInfoModel(parent, childList);
  }

  ///从本地存储中读取用户数据
  UserInfoModel getCacheParentInfo() {
    String parentInfo = SpUtils.instance.getString(SpConst.parentInfo);
    String childList = SpUtils.instance.getString(SpConst.childList);
    ParentInfoModel p = ParentInfoModel();
    List<ChildInfoModel> cList = List.empty(growable: true);
    if (parentInfo.isNotEmpty) {
      Map<String, dynamic> parentJson = json.decode(parentInfo);
      p = ParentInfoModel.fromJson(parentJson);
    }
    if (childList.isNotEmpty) {
      List childListJson = json.decode(childList);
      for (var c in childListJson) {
        if (c is Map<String, dynamic>) {
          var ci = ChildInfoModel.fromJson(c);
          cList.add(ci);
        } else {
          print("child info data format is error.$c");
        }
      }
    }
    print("child length:${cList.length}");

    return UserInfoModel(p, cList);
  }

  void addChildInfo(List<ChildInfoModel> childList) {
    String childListStr = json.encode(childList);
    SpUtils.instance.putString(SpConst.childList, childListStr);
  }

  Future<bool> logout() async {
    SpUtils.instance.delete(SpConst.parentInfo);
    SpUtils.instance.delete(SpConst.childList);
    return true;
  }
}
