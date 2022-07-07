import 'package:hive_flutter/adapters.dart';

class SpUtils {
  static const String _subDir = "le";
  static const String _fileName = "le_sp";

  static SpUtils? _instance;

  late Box _box;

  //私有的命名构造函数
  SpUtils._internal();

  //工厂模式
  factory SpUtils() => _getInstance();

  static SpUtils _getInstance() {
    _instance ??= SpUtils._internal();
    return _instance!;
  }

  static SpUtils get instance => _getInstance();

  Future<void> spInit() async {
    await Hive.initFlutter(_subDir);
    // await Hive.openLazyBox(name)
    _box = await Hive.openBox(_fileName);
  }

  Future<void> putString(String key, String value) {
    return _box.put(key, value);
  }

  String getString(String key, {String defaultValue = ""}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  Future<void> putInt(String key, int value) {
    return _box.put(key, value);
  }

  int getInt(String key, {int defaultValue = -1}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  Future<void> putDouble(String key, double value) {
    return _box.put(key, value);
  }

  int getDouble(String key, {double defaultValue = -1}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  Future<void> putBool(String key, bool value) {
    return _box.put(key, value);
  }

  int getBool(String key, {bool defaultValue = false}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  Future<void> delete(String key) {
    return _box.delete(key);
  }

  Future<void> clear() {
    return _box.clear();
  }
}
