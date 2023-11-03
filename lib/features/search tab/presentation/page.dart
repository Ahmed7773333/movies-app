import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/search%20tab/data/search_tab_remote.dart';
import 'package:movies_app/features/search%20tab/presentation/search%20tab%20cubit/search_tab_cubit.dart';
import 'package:movies_app/features/search%20tab/presentation/widgets/search_bar.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/components/space.dart';
import '../../../core/utils/styles.dart';
import 'widgets/search_list.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SearchTabCubit(SearchRemote());
      },
      child: BlocConsumer<SearchTabCubit, SearchTabState>(
        listener: (context, state) {
          if (state is SearchListLoadingState) {
            debugPrint('loading...');
          } else if (state is SearchListErrorState) {
            debugPrint('error...');
          } else if (state is SearchListSuccessState) {
            debugPrint('working...');
          } else if (state is SearchKeyWordState) {
            SearchTabCubit.get(context).getSearchlList(
                SearchTabCubit.get(context).searchController.text);
            debugPrint('i found it');
          }
        },
        builder: (context, state) {
          final bloc = SearchTabCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: CustomTextField(
                    controller: bloc.searchController,
                    hint: 'Search',
                    onPreClicked: bloc.submit,
                    func: bloc.submit,
                  ),
                ),
                bloc.searchlList.isNotEmpty
                    ? SearchListView(
                        bloc.searchlList,
                      )
                    : Column(
                        children: [
                          const VerticalSpace(275),
                          Image.asset(
                            empty,
                            width: 78.w,
                            height: 88,
                          ),
                          const VerticalSpace(10),
                          Text('No movies found', style: smallText2),
                        ],
                      ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
