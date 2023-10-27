import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SearchTab',
          style: smallText,
        ),
      ),
    );
  }
}
