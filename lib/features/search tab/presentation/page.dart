import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/search%20tab/presentation/widgets/search_bar.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
            controller: searchController,
            hint: 'Search',
            onPreClicked: () {},
            func: () {}),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              empty,
              width: 78.w,
              height: 88,
            ),
            const VerticalSpace(11),
            Text(
              'No movies found',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6745098233222961),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
