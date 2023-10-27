import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'BrowseTab',
          style: smallText,
        ),
      ),
    );
  }
}
