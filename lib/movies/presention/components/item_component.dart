import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/extensions.dart';

import '../../../core/utils/constants/app_constants.dart';
import '../controller/movie_cubit/movies_cubit.dart';
import 'my_text.dart';

class ItemComponent extends StatelessWidget {
  const ItemComponent({
    super.key,
    required this.index,
    required this.movieList,
  });

  final List movieList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: AppConstants.itemComponentsHeight(context),
                    width: context.width() / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        movieList[index].backdropPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: AppConstants.itemComponentsHeight(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MyText(
                              '${movieList[index].title}',
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: MyText(
                                        '${movieList[index].releaseDate}',
                                        overflow: TextOverflow.ellipsis),
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: context.width() / 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Expanded(
                                  child: MyText(
                                    '${movieList[index].voteAverage}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            MyText(
                              '${movieList[index].overview}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              fontSize: 16,
                            ),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
