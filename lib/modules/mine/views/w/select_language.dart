import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebs/common/le_application.dart';
import 'package:lebs/constants/le_color.dart';
import 'package:lebs/constants/sp_const.dart';
import 'package:lebs/intl/tran_intl.dart';
import 'package:lebs/utils/screen_utils.dart';
import 'package:lebs/utils/sp_utils.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.f(900),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ScreenUtils.w(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: ScreenUtils.w(40)),
            child: Text(
              Intl.chooseLanguage.tr,
              style: TextStyle(
                color: Color(LeColor.cff333333),
                fontSize: ScreenUtils.f(50),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _changeLanguage(LanguageSupport.zhCN);
            },
            child: Text(
              "简体中文",
              style: TextStyle(
                  color: Color(
                    LeApplication.isZh()
                        ? LeColor.cff7580E5
                        : LeColor.cff333333,
                  ),
                  fontSize: ScreenUtils.f(50)),
            ),
          ),
          TextButton(
            onPressed: () {
              _changeLanguage(LanguageSupport.en);
            },
            child: Text(
              "English",
              style: TextStyle(
                color: Color(
                  !LeApplication.isZh() ? LeColor.cff7580E5 : LeColor.cff333333,
                ),
                fontSize: ScreenUtils.f(50),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              Intl.cancel.tr,
              style: TextStyle(
                color: Color(
                  LeApplication.isZh() ? LeColor.cff7580E5 : LeColor.cff333333,
                ),
                fontSize: ScreenUtils.f(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _changeLanguage(String language) {
    Locale l;
    if (language == LanguageSupport.zhCN) {
      l = const Locale('zh');
      LeApplication.language = "zh";
    } else {
      LeApplication.language = "en";
      l = const Locale("en");
    }
    SpUtils.instance.putString(SpConst.language, LeApplication.language);
    Get.back();
    Get.updateLocale(l);
  }
}
