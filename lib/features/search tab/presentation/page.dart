import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/search%20tab/presentation/widgets/search_bar.dart';

import '../../../core/api/api_functions/api_manager_functions.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/components/space.dart';
import '../../../core/utils/styles.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: CustomTextField(
              controller: searchController,
              hint: 'Search',
              onPreClicked: submit,
              func: submit,
            ),
          ),
          FutureBuilder(
            future: ApiManager.getMovies(index: 4, q: q),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong!"));
              }
              var resultsList = snapshot.data?.results ?? [];
              return resultsList.isNotEmpty? SearchListView(
                resultsList,
              ): Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      empty,
                      width: 78.w,
                      height: 88,
                    ),
                    const VerticalSpace(11),
                    Text(
                      'No movies found',
                      style: smallText2
                    ),
                  ],
                ),
              );
            },
          )
        ]),
      ),
    );
  }

  String q = '';
  void submit() {
    setState(() {
      q = searchController.text;
      debugPrint(q);
    });
  }
}
