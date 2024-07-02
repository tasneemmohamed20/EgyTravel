import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/floating_button.dart';
import 'package:egy_travel/view/Widgets/shared_details.dart';
import 'package:egy_travel/view_model/AreticlesById/cubit/articles_by_id_cubit.dart';
import 'package:egy_travel/view_model/ArticlesAddRemove/cubit/art_add_remove_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ArticlesDetailsScreen extends StatefulWidget {
  const ArticlesDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.description,
    required this.id,
  });
  final String image;
  final String title;
  final String? subtitle;
  final String id;
  final List<String> description;

  @override
  State<ArticlesDetailsScreen> createState() => _ArticlesDetailsScreenState();
}

class _ArticlesDetailsScreenState extends State<ArticlesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ArticleByIdCubit>()..getPlaceById(widget.id),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SharedDetials(
                      description: widget.description,
                      image: widget.image,
                      subtitle: widget.subtitle ?? '',
                      title: widget.title,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<ArticleByIdCubit>()..getPlaceById(widget.id),
                ),
                BlocProvider(
                  create: (context) => getIt<ArtAddRemoveCubit>(),
                ),
              ],
              child: ArtFav(
                id: widget.id,
              ),
            ),
          ),
        ));
  }
}
