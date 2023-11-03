// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_list_view.dart';

import '../../../../core/api/api_functions/api_manager_functions.dart';

class CatgeorytIdListview extends StatelessWidget {
  final String cat;
  final num id;
  const CatgeorytIdListview({
    Key? key,
    required this.cat,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cat,
          style: largeText,
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getCategories(catID: id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());

            return const Center(child: Text("Something went wrong!"));
          }
          List<Results> resultsList = snapshot.data?.results!.toList() ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 12),
                child: CategoryListItem(movie: resultsList[index]),
              );
            },
            itemCount: resultsList.length,
          );
        },
      ),
    );
  }
}
