import 'package:get/get.dart';
import 'package:lebs/intl/tran_intl.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          Intl.home: "主页",
          Intl.schedule: "课表",
          Intl.history: "历史课程",
          Intl.discovery: "发现",
          Intl.me: "我的",
          Intl.login: "登录",
          Intl.addStudent: "添加学生",
          Intl.studentProfile: "学生信息"
        },
        'en': {
          Intl.home: "Home",
          Intl.schedule: "Schedule",
          Intl.history: "History",
          Intl.discovery: "Discovery",
          Intl.me: "Me",
          Intl.login: "Login",
          Intl.addStudent: "Add Student",
          Intl.studentProfile: "Student Profile"
        }
      };
}
