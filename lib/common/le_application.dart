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

  static String language = "zh";
  static bool isZh() {
    return language.contains("zh");
  }
}
