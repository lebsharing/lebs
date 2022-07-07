import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/modules/account/login/data/parent_info_model.dart';
import 'package:lebs/utils/random_utils.dart';

class UserService {
  static Future<ParentInfoModel> login({String? email, String? pwd}) {
    return Future.delayed(const Duration(seconds: 3), () {
      return ParentInfoModel(
          id: Random.secure().nextInt(100000000),
          token: "kkdkdkdkkddkkddkdkdkdkdkkdkdkdkdkddkk");
    });
  }

  static Future<List<ChildInfoModel>> requestChildList() {
    return Future.delayed(const Duration(seconds: 3), () {
      return List<ChildInfoModel>.generate(Random.secure().nextInt(10),
          (index) {
        WordPair word = generateWordPairs().first;
        return ChildInfoModel(
          childId: RandomUtils.generateId(),
          name: word.first + " " + word.second,
          gender: RandomUtils.gender(),
        );
      });
    });
  }
}
