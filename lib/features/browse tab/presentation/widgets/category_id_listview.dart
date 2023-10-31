// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../search tab/presentation/widgets/search_listViewitem.dart';

class CatgeorytIdListview extends StatelessWidget {
  final String cat;
  final int id;
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
        future: ApiManager.getSimilarMovies(id: id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong!"));
          }
          List<Results> resultsList = snapshot.data?.results!.toList() ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 12),
                child: SearchListItem(movie: resultsList[index]),
              );
            },
            itemCount: resultsList.length,
          );
        },
      ),
    );
  }
}
