import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/home%20tab/data/home_remote.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/carousel_slider_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/new_releases_listview.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/recomended_listview.dart';

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
          if (state is RecomendedListLoadingState ||
              state is ReleaseListLoadingState ||
              state is CarouselListLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
            debugPrint('loading...');
          } else if (state is RecomendedListErrorState ||
              state is ReleaseListErrorState ||
              state is CarouselListErrorState) {
            debugPrint('error...');
          } else if (state is RecomendedListSuccessState &&
              state is ReleaseListSuccessState &&
              state is CarouselListSuccessState) {
            Navigator.pop(context);
            debugPrint('working...');
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: Stack(
              children: [
                Column(
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
                    Expanded(
                        child: RecommendedListItems(
                      HomeTabCubit.get(context).recomendedList,
                    )),
                    const VerticalSpace(10),
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
