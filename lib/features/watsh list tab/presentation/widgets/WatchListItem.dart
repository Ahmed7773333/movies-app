import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../../../../core/utils/assets.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.asset(
                    actionCat,
                    fit: BoxFit.fill,
                  ),
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(booked))
              ],
            ),
            const HorizontalSpace(5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alita Battle Angel",
                    style: mediumText,
                  ),
                  const VerticalSpace(5),
                  Text(
                    "2019",
                    style: smallText2,
                  ),
                  const VerticalSpace(5),
                  Text("Rosa Salazar, Christoph Waltz",
                      style: smallText2, overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
        const VerticalSpace(15),
        Divider(
          color: Colors.white,
          indent: 20.5.w,
          endIndent: 33.5.w,
          height: 1,
        ),
        const VerticalSpace(25),
      ],
    );
  }
}
