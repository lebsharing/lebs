import 'package:lebs/intl/tran_intl.dart';

class MainConfig {
  ///主页tab
  static const tabList = [
    TabConfig("assets/images/main/main_page_home_n.png",
        "assets/images/main/main_page_home_y.png", Intl.home),
    TabConfig("assets/images/main/main_page_schedule_n.png",
        "assets/images/main/main_page_schedule_y.png", Intl.schedule),
    TabConfig("assets/images/main/main_page_history_n.png",
        "assets/images/main/main_page_history_y.png", Intl.history),
    TabConfig("assets/images/main/main_page_discovery_n.png",
        "assets/images/main/main_page_discovery_y.png", Intl.discovery),
    TabConfig("assets/images/main/main_page_me_n.png",
        "assets/images/main/main_page_me_y.png", Intl.me),
  ];
}

class TabConfig {
  final String icon;
  final String selectIcon;
  final String name;
  const TabConfig(this.icon, this.selectIcon, this.name);
}
