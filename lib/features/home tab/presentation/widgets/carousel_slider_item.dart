import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components/movie_item.dart';
import '../../../../core/utils/styles.dart';
import '../../data/home_remote.dart';
import '../home_tab/home_tab_cubit.dart';

class CarouselSliderItem extends StatelessWidget {
  final List<Results> movie;

  const CarouselSliderItem({required this.movie, super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 1,
          viewportFraction: 1),
      items: movie.map((i) {
        return Builder(
          builder: (BuildContext context) {
            final Widget image = i.backdropPath != null
                ? Image.network(
                    "https://image.tmdb.org/t/p/w500/${i.backdropPath}",
                    fit: BoxFit.fill,
                  )
                : i.posterPath != null
                    ? Image.network(
                        "https://image.tmdb.org/t/p/w500/${i.posterPath}",
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        logo,
                        fit: BoxFit.fill,
                      );

            return OpenContainers(
                closedWidget: Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 217.h,
                          width: double.infinity,
                          child: image,
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
                            )),
                      ],
                    ),
                    Positioned(
                      left: 20.w,
                      top: 100.h,
                      child: MovieItem(
                        height: 199,
                        width: 129,
                        movie: i,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 164.w,
                            ),
                            child: BlocProvider(
                              create: (context) =>
                              HomeTabCubit(HomeRemote())
                                ..getMovieRuntime(id: i.id!),
                              child: BlocConsumer<HomeTabCubit, HomeTabState>(
                                listener: (context, state) {
                                  if (state is HomeLoadingState) {
                                    debugPrint('loading...');
                                  } else if (state is HomeErrorState) {
                                    debugPrint('error...');
                                  } else if (state is HomeSuccessState) {
                                    debugPrint('working...');
                                  }
                                },
                                builder: (context, state) {
                                  int hours = HomeTabCubit.get(context).runTime ~/ 60;
                                  return RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(text: i.title, style: tmpText),
                                        TextSpan(
                                          text:
                                          '\n\n${i.releaseDate?.substring(0, 4)}',
                                          style:
                                          smallText3.copyWith(color: greyColor),
                                        ),
                                        TextSpan(
                                          text:
                                          "  ${hours}h ${HomeTabCubit.get(context).runTime%60}m",
                                          style:
                                          smallText3.copyWith(color: greyColor),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                openedWidget: MovieDetailsScreen(movie: i));
          },
        );
      }).toList(),
    );
  }
}
