// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_list_view.dart';
import '../browse cubit/browse_cubit.dart';
import '../browse cubit/browse_state.dart';

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
    return BlocProvider(
      create: (context) => BrowseCubit()..getCategories(catID: id.toString()),
      child: BlocConsumer<BrowseCubit, BrowseStates>(
        listener: (context, state) {
          if (state is BrowseGetCategoriesLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (state is BrowseGetCategoriesErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                    child: Text(
                  "SomeThing Went Wrong!",
                  style: mediumText.copyWith(color: Colors.black),
                )),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  cat,
                  style: largeText,
                ),
              ),
              body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 12),
                      child: CategoryListItem(
                          movie: BrowseCubit.get(context).resultsList[index]),
                    );
                  },
                  itemCount: BrowseCubit.get(context).resultsList.length));
        },
      ),
    );
  }
}
