import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/watsh%20list%20tab/data/data%20source/remote/watch_list_remote.dart';
import 'package:movies_app/features/watsh%20list%20tab/presentation/watch%20list%20cubit/watch_list_cubit.dart';
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
    return BlocProvider(
      create: (context) =>
          WatchListCubit(WatchListRemote()..getWatchlistMovies()),
      child: BlocConsumer<WatchListCubit, WatchListState>(
        listener: (context, state) {
          if (state is WatchListLoadingState) {
            debugPrint('loading...');
          } else if (state is WatchListErrorState) {
            debugPrint('error...');
          } else if (state is WatchListSuccessState) {
            debugPrint('working...');
          } else if (state is DeletedState) {
            WatchListCubit.get(context).getWatchlList();
            debugPrint('Deleted');
          }
        },
        builder: (context, state) {
          final bloc = WatchListCubit.get(context);

          return Scaffold(
              body: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 80.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "WatchList",
                        style: largeText,
                      ),
                      bloc.watchlList.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: ((context, index) {
                                  return WatchListItem(
                                    movie: bloc.watchlList[index],
                                    onTapp: () {
                                      bloc.deleteMovie(bloc.watchlList[index]);
                                    },
                                  );
                                }),
                                itemCount: bloc.watchlList.length,
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
                            ),
                    ],
                  )));
        },
      ),
    );
  }
}
