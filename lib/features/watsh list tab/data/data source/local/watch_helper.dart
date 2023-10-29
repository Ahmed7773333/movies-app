import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/watsh%20list%20tab/data/data%20source/local/watch.dart';

class WatchHelper {
  static const String boxName = 'watchListBox';

  static add(WatchListDB category) {
    Box<WatchListDB> categoryBox = Hive.box(boxName);
    categoryBox.add(category);
  }

  static List<WatchListDB> getAll() {
    Box<WatchListDB> categoryBox = Hive.box(boxName);
    return categoryBox.values.toList().cast<WatchListDB>();
  }

  static WatchListDB? getById(int id) {
    Box<WatchListDB> categoryBox = Hive.box(boxName);
    return categoryBox.getAt(id);
  }

  static delete(int id) {
    Box<WatchListDB> categoryBox = Hive.box(boxName);
    categoryBox.deleteAt(id);
  }

  static cler() {
    Box<WatchListDB> categoryBox = Hive.box(boxName);
    categoryBox.clear();
  }
}
