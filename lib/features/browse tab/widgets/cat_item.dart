import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(actionCat,fit: BoxFit.fill,),
          Text("Action",),
        ],
      ),
    );
  }
}
