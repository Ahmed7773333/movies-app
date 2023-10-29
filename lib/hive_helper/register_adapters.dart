import 'package:hive/hive.dart';
import 'package:movies_app/features/watsh list tab/data/data source/local/watch.dart';

void registerAdapters() {
	Hive.registerAdapter(WatchListDBAdapter());
}
