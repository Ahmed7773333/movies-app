import 'package:flutter/material.dart';
import 'package:movies_app/features/search%20tab/presentation/widgets/search_listViewitem.dart';
import '../../../../core/api/models/movie_item.dart';

class SearchListView extends StatefulWidget {
  final List<Results> resultsList;

  const SearchListView(this.resultsList, {super.key});

  @override
  State<SearchListView> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<SearchListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,top: 12),
          child: SearchListItem(movie: widget.resultsList[index]),
        );
      },
      itemCount: widget.resultsList.length,
    ));
  }
}
