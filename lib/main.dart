import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/config/themes.dart';
import 'package:movies_app/features/watsh%20list%20tab/data/data%20source/local/watch.dart';
import 'package:movies_app/features/watsh%20list%20tab/data/data%20source/local/watch_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'features/bottom bar screen/presentation/bottom_bar.dart';
import 'features/splach screen/splach_screen.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  hive.Hive.registerAdapter(WatchListDBAdapter());
  await Hive.openBox<WatchListDB>(WatchHelper.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: mode,
          initialRoute: SplachScreen.routeName,
          routes: {
            SplachScreen.routeName: (context) => const SplachScreen(),
            BottomBarScreen.routeName: (context) => const BottomBarScreen(),
          },
        ));
  }
}
