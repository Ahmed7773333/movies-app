import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/second_listview_item.dart';
import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../../core/api/models/movie_item.dart';

class SecondListItems extends StatefulWidget {
  List<Results> resultsList;
  SecondListItems(this.resultsList, {super.key});

  @override
  State<SecondListItems> createState() => _SecondListState();
}

class _SecondListState extends State<SecondListItems> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        }
        var resultsList = snapshot.data?.results ?? [];
        debugPrint('${resultsList.length}');
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SecondListViewItem(
                image: bigTemp, movie: resultsList[index]);
          },
          itemCount: resultsList.length,
        );
      },
    );
  }
}
