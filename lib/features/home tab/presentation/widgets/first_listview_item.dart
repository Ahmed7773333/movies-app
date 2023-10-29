import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';

class NewReleasesListViewItem extends StatefulWidget {
  Results movie;
  NewReleasesListViewItem({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  State<NewReleasesListViewItem> createState() => _NewReleasesListViewItemState();
}

class _NewReleasesListViewItemState extends State<NewReleasesListViewItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OpenContainers(
            closedWidget: SizedBox(
              width: 96.87.w,
              height: 127.74.h,
              child: Image.network("https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}"),
            ),
            openedWidget: MovieDetailsScreen()),
        Positioned(
            left: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                isBooked = isBooked == false ? true : false;
                setState(() {});
              },
              child: SizedBox(
                  width: 27.w,
                  height: 36.h,
                  child: Image.asset(isBooked ? booked : notBooked)),
            ))
      ],
    );
  }
}
