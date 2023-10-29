import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_functions/api_manager_functions.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/components/list_view.dart';
import 'package:movies_app/core/utils/components/movie_item.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/first_listview_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/second_listview.dart';

import '../../../core/utils/assets.dart';
import 'widgets/second_listview_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isBooked = false;
  List<FirstListViewItem> firstList = [
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp),
    FirstListViewItem(image: bigTemp)
  ];
  // List<SecondListViewItem> secondList = [
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  // ];

  Results movie= Results(title: "DeadPool",voteAverage: 7.7,releaseDate: "2019-5-12");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 217.h,
                    width: double.infinity,
                    child: Image.asset(
                      bigTemp,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: ImageIcon(
                        AssetImage(play),
                        size: 60.sp,
                        color: Colors.white,
                      ))
                ],
              ),
              const VerticalSpace(14),
              Padding(
                padding: EdgeInsets.only(left: 164.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Dora and the lost city of gold\n',
                          style: tmpText),
                      TextSpan(
                        text: '2019 PG-13 2h 7m',
                        style: smallText,
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpace(43),
              HorizontalListView(
                hight: 187,
                list: firstList,
                text: 'New Release',
              ),
              const VerticalSpace(30),
              SecondListViewItem(image: bigTemp, movie: movie),
              FutureBuilder(future: ApiManager.getMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong!"));
                    }
                    var resultsList = snapshot.data?.results ?? [];
                    return Expanded(child: SecondListItems(resultsList,));
                  },
              ),
              // HorizontalListView(
              //   hight: 250,
              //   list: secondList,
              //   text: 'Recomended',
              // ),
            ],
          ),
          Positioned(
            left: 21.w,
            top: 90.h,
            child: const MovieItem(height: 199, width: 129),
          ),
        ],
      ),
    ));
  }
}
