import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/themes.dart';
import 'package:movies_app/core/utils/observer.dart';
import 'features/bottom bar screen/presentation/bottom_bar.dart';
import 'features/splach screen/splach_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
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
