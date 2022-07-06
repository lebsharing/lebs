import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lebs/intl/Message.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/routes/route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(2048, 1536),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (ctx, child) {
        return GetMaterialApp(
          title: 'lbs',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          translations: Messages(),
          initialRoute: RouteName.root,
          getPages: RoutePage.routes,
        );
      },
    );
  }
}
