import 'package:flutter/material.dart';
import 'package:lebs/utils/screen_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Loading...",
        style: TextStyle(
          fontSize: ScreenUtils.f(36),
        ),
      ),
    );
  }
}

class LoadErrorWidget extends StatelessWidget {
  const LoadErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error",
        style: TextStyle(
          fontSize: ScreenUtils.f(36),
        ),
      ),
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Data",
        style: TextStyle(
          fontSize: ScreenUtils.f(36),
        ),
      ),
    );
  }
}
