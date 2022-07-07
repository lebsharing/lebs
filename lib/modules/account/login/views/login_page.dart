import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.login.tr),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(onPressed: () {}, child: Text(Intl.login.tr))
          ],
        ),
      ),
    );
  }
}
