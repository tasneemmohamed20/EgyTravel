import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/colors_manager.dart';
import '../../../view_model/AreticlesById/cubit/articles_by_id_cubit.dart';
import '../../../view_model/AreticlesById/cubit/articles_by_id_state.dart';
import '../../../view_model/ArticlesAddRemove/cubit/art_add_remove_cubit.dart';
import '../../../view_model/ArticlesAddRemove/cubit/art_add_remove_state.dart';

class ArtFav extends StatefulWidget {
  const ArtFav({super.key, required this.id});
  final String id;

  @override
  State<ArtFav> createState() => _ArtFavState();
}

class _ArtFavState extends State<ArtFav> {
  bool? isFav;

  @override
  void initState() {
    //getIt<ArticleByIdCubit>().getArticleById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleByIdCubit, ArticleByIdState>(
      buildWhen: (previous, current) =>
          current is ArtLoading || current is ArtSuccess || current is ArtError,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      backgroundColor: ColorsManager.primary.withOpacity(1),
                      shape: const CircleBorder(),
                      heroTag: null,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: ColorsManager.secondPrimary.withOpacity(1),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
            success: (articlesById) {
              isFav = articlesById.data!.articlesData!.isFavorite!;
              return Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<ArtAddRemoveCubit, ArtAddRemoveState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          loading: () => FloatingActionButton(
                                backgroundColor:
                                    ColorsManager.primary.withOpacity(1),
                                shape: const CircleBorder(),
                                heroTag: null,
                                child: Icon(
                                  isFav == true
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_outlined,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                ),
                                onPressed: () {},
                              ),
                          error: (error) => FloatingActionButton(
                                backgroundColor:
                                    ColorsManager.primary.withOpacity(1),
                                shape: const CircleBorder(),
                                heroTag: null,
                                child: Icon(
                                  isFav == true
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_outlined,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                ),
                                onPressed: () {},
                              ),
                          success: (addRemoveResponseModel) {
                            debugPrint(isFav.toString());
                            if (addRemoveResponseModel
                                .data!.userData!.favoriteArticles!
                                .contains(widget.id)) {
                              isFav = true;
                            } else {
                              isFav = false;
                            }
                           
                            return FloatingActionButton(
                              backgroundColor:
                                  ColorsManager.primary.withOpacity(1),
                              shape: const CircleBorder(),
                              heroTag: null,
                              child: Icon(
                                isFav == true
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_outlined,
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                              ),
                              onPressed: () {
                                if (isFav == true) {
                                  context
                                      .read<ArtAddRemoveCubit>()
                                      .removeFav(widget.id);
                                } else {
                                  context
                                      .read<ArtAddRemoveCubit>()
                                      .addFav(widget.id);
                                }
                              },
                            );
                          },
                          orElse: () {
                            return FloatingActionButton(
                              backgroundColor:
                                  ColorsManager.primary.withOpacity(1),
                              shape: const CircleBorder(),
                              heroTag: null,
                              child: Icon(
                                isFav == true
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_outlined,
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                              ),
                              onPressed: () {
                                if (isFav == true) {
                                  context
                                      .read<ArtAddRemoveCubit>()
                                      .removeFav(widget.id);
                                } else {
                                  context
                                      .read<ArtAddRemoveCubit>()
                                      .addFav(widget.id);
                                }
                              },
                            );
                          });
                    },
                  ),
                ),
              );
            },
            error: (errorHandler) {
              return const Text('Error!!!');
            },
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
