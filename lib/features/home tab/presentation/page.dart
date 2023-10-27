import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'home',
          style: smallText,
        ),
      ),
    );
  }
}
