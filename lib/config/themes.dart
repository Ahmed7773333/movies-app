import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

ThemeData mode = ThemeData(
  scaffoldBackgroundColor: blackColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedLabelStyle: const TextStyle(fontSize: 14),
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    backgroundColor: navigationBarColor,
    selectedItemColor: goldColor,
    unselectedItemColor: greyColor,
    type: BottomNavigationBarType.fixed,
  ),
);
