import 'dart:ui';

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
    if (l.languageCode?.toLowerCase() == "en" ||
        l.languageCode?.toLowerCase() == "zh") {
      return Locale(l.languageCode);
    }
    return Locale("en");
  }
}
