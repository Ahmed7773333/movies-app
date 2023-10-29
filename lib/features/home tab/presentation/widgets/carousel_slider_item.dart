import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/app_colors.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components/movie_item.dart';
import '../../../../core/utils/components/space.dart';
import '../../../../core/utils/styles.dart';

class CarouselSliderItem extends StatelessWidget {
  List<Results> movie;

  CarouselSliderItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.5,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeFactor: 1,
        viewportFraction: 1
        
      ),
      items: movie.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 217.h,
                      width: double.infinity,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${i.backdropPath}",
                        fit: BoxFit.fill,
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
                        )),
                  ],
                ),
                Positioned(
                  left: 20.w,
                  top: 100.h,
                  child: MovieItem(
                      height: 199,
                      width: 129,
                      image: "https://image.tmdb.org/t/p/w500/${i.posterPath}"),
                ),
                Positioned(
                  bottom: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 164.w,),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: i.title,
                                  style: tmpText),
                              TextSpan(
                                text: '\n\n${i.releaseDate?.substring(
                                    0, 4)}  PG-13  2h 7m',
                                style: smallText3.copyWith(color: greyColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }
}

//Stack(
//                   children: [
//                     SizedBox(
//                       height: 217.h,
//                       width: double.infinity,
//                       child: Image.network("https://image.tmdb.org/t/p/w500/${i.posterPath}",fit: BoxFit.fill,
//                       ),
//                     ),
//                     Positioned(
//                         left: 0,
//                         top: 0,
//                         right: 0,
//                         bottom: 0,
//                         child: ImageIcon(
//                           AssetImage(play),
//                           size: 60.sp,
//                           color: Colors.white,
//                         )),
//                     Column(
//                       children: [
//                         const VerticalSpace(14),
//                         Padding(
//                           padding: EdgeInsets.only(left: 164.w),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                     text: i.title,
//                                     style: tmpText),
//                                 TextSpan(
//                                   text: '${i.releaseDate?.substring(0,4)}PG-13 2h 7m',
//                                   style: smallText,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                       left: 21.w,
//                       top: 90.h,
//                       child: MovieItem(height: 199, width: 129,image: "https://image.tmdb.org/t/p/w500/${i.posterPath}"),
//                     ),
//                   ],
//                 ),
