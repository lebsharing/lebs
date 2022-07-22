import 'package:flutter/material.dart';

class UnityHomeworkPage extends StatelessWidget {
  const UnityHomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Unity"),
            Text(DateTime.now().toIso8601String()),
          ],
        ),
      ),
    );
  }
}
