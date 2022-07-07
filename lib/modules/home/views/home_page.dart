import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../account/login/controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Home 3d"),
            Obx(
              () => Text(UserController.to.isLogin() == null
                  ? "Controller is NULL"
                  : (UserController.to.isLogin()
                      ? "Alerady Login"
                      : " Not Login")),
            ),
          ],
        ),
      ),
    );
  }
}
