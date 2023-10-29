import 'package:hive/hive.dart';
import 'package:movies_app/hive_helper/hive_types.dart';
import 'package:movies_app/hive_helper/hive_adapters.dart';
import 'package:movies_app/hive_helper/fields/watch_list_db_fields.dart';


part 'watch.g.dart';


@HiveType(typeId: HiveTypes.watchListDb, adapterName: HiveAdapters.watchListDb)
class WatchListDB extends HiveObject{
  WatchListDB(
      {required this.image,
      required this.title,
      required this.date,
      required this.isBooked,
      required this.path,
      required this.details});
	@HiveField(WatchListDBFields.image)
  String image;
	@HiveField(WatchListDBFields.title)
  String title;
	@HiveField(WatchListDBFields.date)
  String date;
  bool isBooked = true;
	@HiveField(WatchListDBFields.path)
  String path;
	@HiveField(WatchListDBFields.details)
  String details;
}