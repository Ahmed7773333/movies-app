import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/data/browse_tab_remote.dart';
import 'package:movies_app/features/browse%20tab/presentation/browse%20cubit/browse_cubit.dart';
import 'package:movies_app/features/browse%20tab/presentation/browse%20cubit/browse_state.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_model.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/grid_view.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCubit(BrowseRemote()),
      child: BlocConsumer<BrowseCubit, BrowseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = BrowseCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Browse Category",
                  style: largeText,
                ),
                Expanded(
                    child: GridViewCatItem(
                        CategoryModel.getCategories(bloc.view))),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: bloc.changeView,
                        child: bloc.view
                            ? const Text("View less")
                            : const Text("View more")),
                  ],
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
