import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WatchListTab',
          style: smallText,
        ),
      ),
    );
  }
}
