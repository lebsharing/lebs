import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';

import '../../account/login/controllers/user_controller.dart';

///充值 购买课程
class AddClassesPage extends StatelessWidget {
  const AddClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intl.addClasses.tr,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add Classes"),
            Obx(
              () => Text(UserController.to.isLogin()
                  ? (UserController.to.curChild.name ?? "")
                  : "Sin in"),
            ),
          ],
        ),
      ),
    );
  }
}
