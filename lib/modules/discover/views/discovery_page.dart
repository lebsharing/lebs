import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../account/login/controllers/user_controller.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Discover"),
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
