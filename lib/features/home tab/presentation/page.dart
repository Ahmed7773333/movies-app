import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_functions/api_manager_functions.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/components/movie_item.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/carousel_slider_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/new_releases_listview.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/recomended_listview.dart';
import '../../../core/utils/assets.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isBooked = false;
  Results movie= Results(title: "DeadPool",voteAverage: 7.7,releaseDate: "2019-5-12");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              FutureBuilder(future: ApiManager.getMovies(index: 1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong!"));
                  }
                  var resultsList = snapshot.data?.results ?? [];
                  return CarouselSliderItem(movie: resultsList,);
                },
              ),
              const VerticalSpace(43),
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: FutureBuilder(future: ApiManager.getMovies(index: 2),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong!"));
                    }
                    var resultsList = snapshot.data?.results ?? [];
                    return NewReleasesListView(resultsList: resultsList,);
                  },
                ),
              ),
              const VerticalSpace(10),
              FutureBuilder(future: ApiManager.getMovies(index: 3),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong!"));
                    }
                    var resultsList = snapshot.data?.results ?? [];
                    return Expanded(child: RecommendedListItems(resultsList,));
                  },
              ),
              const VerticalSpace(10),
            ],
          ),
        ],
      ),
    ));
  }
}
