import 'package:flutter/cupertino.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/extensions.dart';

import 'item_component.dart';

class MyGridBuilder extends StatelessWidget {
  const MyGridBuilder({
    super.key,
    required this.moviesList,
  });

  final List moviesList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: moviesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 12,
            mainAxisExtent:AppConstants.itemComponentsHeight(context),
        ), itemBuilder: (context,index){
      return  ItemComponent(movieList: moviesList,index: index,);
    });
  }
}
