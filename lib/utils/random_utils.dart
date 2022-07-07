import 'dart:math';

class RandomUtils {
  static int generateId() {
    return Random.secure().nextInt(100000000);
  }

  static int gender() {
    return Random.secure().nextInt(3);
  }
}
