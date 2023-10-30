import 'package:flutter/material.dart';
import 'package:movies_app/features/search%20tab/presentation/widgets/search_bar.dart';

import '../../../core/api/api_functions/api_manager_functions.dart';
import '../../../core/api/models/movie_item.dart';
import 'widgets/search_list.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        CustomTextField(
            controller: searchController,
            hint: 'Search',
            onPreClicked: () {
              searchController.clear();
              setState(() {});
            },
            func: () {
              setState(() {});
            }),
        FutureBuilder(
          future: ApiManager.getMovies(index: 4, q: 'god'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong!"));
            }
            // if (!snapshot.hasData) {
            //   return Center(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Image.asset(
            //           empty,
            //           width: 78.w,
            //           height: 88,
            //         ),
            //         const VerticalSpace(11),
            //         Text(
            //           'No movies found',
            //           style: TextStyle(
            //             color: Colors.white.withOpacity(0.6745098233222961),
            //             fontSize: 13,
            //             fontFamily: 'Inter',
            //             fontWeight: FontWeight.w400,
            //             height: 0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }
            List<Results> resultsList = snapshot.data?.results
                    ?.where((element) =>
                        element.title?.contains(searchController.text) ?? false)
                    .toList() ??
                [];
            return Expanded(
              child: SearchListView(
                resultsList,
              ),
            );
          },
        )
      ]),
    );
  }
}
