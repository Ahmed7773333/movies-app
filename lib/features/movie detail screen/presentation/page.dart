import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'MovieDetailsScreen',
          style: smallText,
        ),
      ),
    );
  }
}
