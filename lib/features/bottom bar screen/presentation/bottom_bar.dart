import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/bottom%20bar%20screen/presentation/widgets.dart';
import 'package:movies_app/features/browse%20tab/presentation/page.dart';
import 'package:movies_app/features/home%20tab/presentation/page.dart';
import 'package:movies_app/features/search%20tab/presentation/page.dart';
import 'package:movies_app/features/watsh%20list%20tab/presentation/page.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const String routeName = "/BottomBar";

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> _pages = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: navigationBarColor,
            icon: NavigationIcon(icon: home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            backgroundColor: navigationBarColor,
            icon: NavigationIcon(icon: search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            backgroundColor: navigationBarColor,
            icon: NavigationIcon(icon: movie),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            backgroundColor: navigationBarColor,
            icon: NavigationIcon(icon: book),
            label: "WATCHLIST",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
