import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/recomended_listview_item.dart';
import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../../core/api/models/movie_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components/space.dart';
import '../../../../core/utils/styles.dart';

class RecommendedListItems extends StatefulWidget {
  final List<Results> resultsList;

  const RecommendedListItems(this.resultsList, {super.key});

  @override
  State<RecommendedListItems> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedListItems> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 184.h,
      color: listViewColor,
      child: Padding(
        padding: EdgeInsets.only(top: 13.h, left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommended",
              style: smallText.copyWith(fontSize: 15),
            ),
            const VerticalSpace(16),
            FutureBuilder(
              future: ApiManager.getMovies(index: 3),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                }
                var resultsList = snapshot.data?.results ?? [];
                debugPrint('${resultsList.length}');
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RecommendedListViewItem(movie: resultsList[index]);
                    },
                    itemCount: resultsList.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
