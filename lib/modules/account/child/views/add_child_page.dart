import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/modules/account/login/controllers/user_controller.dart';
import 'package:lebs/modules/account/login/data/child_info_model.dart';
import 'package:lebs/utils/random_utils.dart';

class AddChildPage extends StatelessWidget {
  const AddChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.studentProfile.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("可以添加的学生信息"),
            OutlinedButton(
              onPressed: () {
                WordPair w = generateWordPairs().first;
                ChildInfoModel child = ChildInfoModel(
                  childId: RandomUtils.generateId(),
                  name: w.first + " " + w.second,
                  gender: RandomUtils.gender(),
                );
                UserController.to.addChild(child);
                Get.back();
              },
              child: Text(Intl.addStudent.tr),
            )
          ],
        ),
      ),
    );
  }
}
