import 'dart:math';

class RandomUtils {
  static int generateId() {
    return Random.secure().nextInt(100000000);
  }

  static int gender() {
    return Random.secure().nextInt(3);
  }

  static int randomInt(int max, {int start = 0}) {
    return Random.secure().nextInt(max) + start;
  }

  static List<DateTime> randomStartAndEndTime(
      DateTime start, DateTime endTime) {
    List<DateTime> result = [];
    Random ran = Random.secure();
    int s = start.millisecondsSinceEpoch;
    int e = endTime.millisecondsSinceEpoch;
    int _base = 1000 * 60;
    int c = (e - s) ~/ _base;
    int _start = ran.nextInt(c) * _base + s;
    int _end = ran.nextInt(c) * _base + s;
    if (_start > _end) {
      result.add(DateTime.fromMillisecondsSinceEpoch(_end));
      result.add(DateTime.fromMillisecondsSinceEpoch(_start));
    } else {
      result.add(DateTime.fromMillisecondsSinceEpoch(_start));
      result.add(DateTime.fromMillisecondsSinceEpoch(_end));
    }
    return result;
  }
}
