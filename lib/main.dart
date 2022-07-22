import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lebs/common/le_application.dart';
import 'package:lebs/intl/Message.dart';
import 'package:lebs/routes/route_name.dart';
import 'package:lebs/routes/route_page.dart';
import 'package:lebs/utils/sp_utils.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  await SpUtils.instance.spInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = window.locale;

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
          localizationsDelegates: [
            MonthYearPickerLocalizations.delegate,
          ],
          translations: Messages(),
          locale: LeApplication.getCurrentLocal(),
          initialRoute: RouteName.root,
          getPages: RoutePage.routes,
        );
      },
    );
  }
}
