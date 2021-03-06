import 'package:get/get.dart';
import 'package:lebs/modules/account/child/views/add_child_page.dart';
import 'package:lebs/modules/account/login/views/login_page.dart';
import 'package:lebs/modules/history/views/homework_mix_page.dart';
import 'package:lebs/modules/main/main/bind/main_bind.dart';
import 'package:lebs/modules/main/main/views/main_page.dart';
import 'package:lebs/modules/main/splash/bindings/splash_bind.dart';
import 'package:lebs/modules/main/splash/presentation/views/splash_page.dart';
import 'package:lebs/modules/mine/views/ittest_page.dart';
import 'package:lebs/modules/web/browser_page.dart';
import 'package:lebs/routes/route_name.dart';

class RoutePage {
  RoutePage._();

  static List<GetPage> routes = [
    GetPage(
      name: RouteName.root,
      page: () => const SplashPage(),
      binding: SplashBind(),
    ),
    GetPage(
      name: RouteName.mainPage,
      page: () => const MainPage(),
      binding: MainBind(),
    ),
    GetPage(name: RouteName.loginPage, page: () => const LoginPage()),
    GetPage(name: RouteName.addChildPage, page: () => const AddChildPage()),
    GetPage(name: RouteName.browserPage, page: () => const BrowserPage()),
    GetPage(name: RouteName.itTestPage, page: () => const ItTestPage()),
    GetPage(name: RouteName.homeworkPage, page: () => const HomeworkMixPage()),
  ];
}
