import 'package:flutter/material.dart';

class OnlineHomeworkPage extends StatelessWidget {
  const OnlineHomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Online"),
            Text(DateTime.now().toIso8601String()),
          ],
        ),
      ),
    );
  }
}
