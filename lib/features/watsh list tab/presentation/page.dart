import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import '../../../core/api/api_functions/api_manager_functions.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/components/space.dart';
import 'widgets/watch_listItem.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "WatchList",
                  style: largeText,
                ),
                FutureBuilder(
                  future: ApiManager.getWatchlistMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    debugPrint('${snapshot.error}');
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong!"));
                    }
                    var resultsList = snapshot.data?.results ?? [];
                    debugPrint('${resultsList.length}');
                    return resultsList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemBuilder: ((context, index) {
                                return WatchListItem(
                                  movie: resultsList[index],
                                  onTapp: () {
                                    ApiManager.deleteFromWatchlist(
                                        resultsList[index]);
                                    debugPrint('deleted');
                                    setState(() {});
                                  },
                                );
                              }),
                              itemCount: resultsList.length,
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  empty,
                                  width: 78.w,
                                  height: 88,
                                ),
                                const VerticalSpace(11),
                                Text('No movies found', style: smallText2),
                              ],
                            ),
                          );
                  },
                ),
              ],
            )));
  }
}
