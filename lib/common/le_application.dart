import 'dart:ui';

import 'package:lebs/constants/sp_const.dart';
import 'package:lebs/utils/sp_utils.dart';

enum ENV {
  ///生成环境
  release,
  pre,
  dev
}

class LeApplication {
  ///设置运行环境
  static const ENV _initEnv = ENV.release;
  static ENV env = _initEnv;

  static String language = "en";
  static bool isZh() {
    return language.contains("zh");
  }

  static Locale getCurrentLocal() {
    Locale l = window.locale;
    if (language == "zh") {
      return const Locale("zh", "CN");
    } else if (language == "en") {
      return const Locale("en");
    }
    if (l.languageCode.toLowerCase() == "en" ||
        l.languageCode.toLowerCase() == "zh") {
      language = l.languageCode;
      return Locale(l.languageCode);
    }
    return const Locale("en");
  }

  static initApp() {
    String lan = SpUtils.instance.getString(SpConst.language);
    if (lan.isNotEmpty) {
      language = lan;
    }
  }
}
