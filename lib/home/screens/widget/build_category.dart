import 'package:shop_app/home/screens/widget/custom_list_view_to_show_all_category.dart';

import '../../../util/widget/failuer_widget.dart';
import '../../../util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/category/category_cubit.dart';

class BuildAllCategories extends StatelessWidget {
  const BuildAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if(state is CategoryFailuerState){
          return FailuerWidget(errorMessage: state.erroMessage);
        }else if(state is CategorySuccessfulyState){
          return CustomListView(allCategories: state.categories);
        }else{
          return const LoadingWidget();
        }
      },
    );
  }
}

