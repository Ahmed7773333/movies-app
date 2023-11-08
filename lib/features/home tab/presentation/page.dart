import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/home%20tab/data/home_remote.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/carousel_slider_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/new_releases_listview.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/recomended_listview.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/popular_series_list.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/series_recommenced_list.dart';

import 'home_tab/home_tab_cubit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeTabCubit(HomeRemote())..getAllLists();
      },
      child: BlocConsumer<HomeTabCubit, HomeTabState>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                )),
              ),
            );
            debugPrint('loading...');
          } else if (state is HomeErrorState) {
            debugPrint('error...');
          }
          if (state is HomeSuccessState) {
            Navigator.pop(context);
            debugPrint('working...');
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CarouselSliderItem(
                        movie: HomeTabCubit.get(context).carouselList,
                      ),
                      const VerticalSpace(43),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: NewReleasesListView(
                          resultsList: HomeTabCubit.get(context).newReleaseList,
                        ),
                      ),
                      const VerticalSpace(10),
                      SizedBox(
                        height: 250.h,
                        width: double.infinity,
                        child: RecommendedListItems(
                          HomeTabCubit.get(context).recomendedList,
                        ),
                      ),
                      const VerticalSpace(17),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: PopularSeriesList(
                          resultsList: HomeTabCubit.get(context).popularSeriesList,
                        ),
                      ),
                      const VerticalSpace(10),
                      SizedBox(
                        width: double.infinity,
                        height: 250.h,
                        child: SeriesRecommendedList(
                          HomeTabCubit.get(context).recommendedSeriesList,
                        ),
                      ),
                      const VerticalSpace(10),
                    ],
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
