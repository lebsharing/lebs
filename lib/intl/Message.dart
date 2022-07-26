import 'package:get/get.dart';
import 'package:lebs/intl/en.dart';
import 'package:lebs/intl/zh_cn.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en': en,
      };
}
