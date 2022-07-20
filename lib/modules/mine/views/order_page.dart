import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';

import '../../account/login/controllers/user_controller.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intl.order.tr,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Order"),
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
