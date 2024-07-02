import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/AreticlesById/cubit/articles_by_id_state.dart';
import 'package:egy_travel/view_model/ArticlesAddRemove/cubit/art_add_remove_cubit.dart';
import 'package:egy_travel/view_model/PlacesAddRemove/cubit/add_remove_cubit.dart';
import 'package:egy_travel/view_model/AreticlesById/cubit/articles_by_id_cubit.dart';
import 'package:egy_travel/view_model/PlaceById/cubit/placeid_cubit.dart';
import 'package:egy_travel/view_model/PlaceById/cubit/placeid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatButtton extends StatefulWidget {
  const CustomFloatButtton(
      {super.key,
      required this.lat,
      required this.long,
      required this.placeId});
  final double lat;
  final double long;
  final String placeId;
  final bool isTrip = false;
  final bool isFavorite = false;

  @override
  State<CustomFloatButtton> createState() => _CustomFloatButttonState();
}

class _CustomFloatButttonState extends State<CustomFloatButtton> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceByIdCubit>().getPlaceById(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceByIdCubit, PlaceByIdState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => ExpandableFab(
                  openButtonBuilder: RotateFloatingActionButtonBuilder(
                    child: Image.asset(
                      Assets.images4,
                      scale: 8,
                    ),
                    fabSize: ExpandableFabSize.regular,
                    // foregroundColor: Colors.amber,
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                  ),
                  closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                    child: Icon(
                      Icons.close_rounded,
                      color: ColorsManager.secondPrimary.withOpacity(1),
                    ),
                    fabSize: ExpandableFabSize.regular,
                    // foregroundColor: Colors.deepOrangeAccent,
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                  ),
                  duration: const Duration(milliseconds: 300),
                  type: ExpandableFabType.up,
                  distance: 80.0,
                  children: [
                    FloatingActionButton(
                      backgroundColor: ColorsManager.primary.withOpacity(1),
                      shape: const CircleBorder(),
                      heroTag: null,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: ColorsManager.secondPrimary.withOpacity(1),
                      ),
                      onPressed: () async {
                        Location location = Location();
                        LocationData locationData;
                        locationData = await location.getLocation();
                        setState(() {
                          launchUrl(Uri.parse(
                              'https://www.google.com/maps/dir/?api=1&origin=${locationData.latitude},${locationData.longitude}&destination=${widget.lat},${widget.long}'));
                        });
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: ColorsManager.primary.withOpacity(1),
                      shape: const CircleBorder(),
                      heroTag: null,
                      child: Icon(
                        Icons.bookmark_add_outlined,
                        color: ColorsManager.secondPrimary.withOpacity(1),
                      ),
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      backgroundColor: ColorsManager.primary.withOpacity(1),
                      shape: const CircleBorder(),
                      heroTag: null,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: ColorsManager.secondPrimary.withOpacity(1),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
            success: (placeByIdModel) {
              return ExpandableFab(
                openButtonBuilder: RotateFloatingActionButtonBuilder(
                  child: Image.asset(
                    Assets.images4,
                    scale: 8,
                  ),
                  fabSize: ExpandableFabSize.regular,
                  // foregroundColor: Colors.amber,
                  backgroundColor: ColorsManager.primary.withOpacity(1),
                  shape: const CircleBorder(),
                ),
                closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                  child: Icon(
                    Icons.close_rounded,
                    color: ColorsManager.secondPrimary.withOpacity(1),
                  ),
                  fabSize: ExpandableFabSize.regular,
                  // foregroundColor: Colors.deepOrangeAccent,
                  backgroundColor: ColorsManager.primary.withOpacity(1),
                  shape: const CircleBorder(),
                ),
                duration: const Duration(milliseconds: 300),
                type: ExpandableFabType.up,
                distance: 80.0,
                children: [
                  FloatingActionButton(
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                    heroTag: null,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: ColorsManager.secondPrimary.withOpacity(1),
                    ),
                    onPressed: () async {
                      Location location = Location();
                      LocationData locationData;
                      locationData = await location.getLocation();
                      setState(() {
                        launchUrl(Uri.parse(
                            'https://www.google.com/maps/dir/?api=1&origin=${locationData.latitude},${locationData.longitude}&destination=${widget.lat},${widget.long}'));
                      });
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                    heroTag: null,
                    child: Icon(
                      placeByIdModel.data?.placesData?.isTrip == true
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_add_outlined,
                      color: ColorsManager.secondPrimary.withOpacity(1),
                    ),
                    onPressed: () {
                      if (placeByIdModel.data?.placesData?.isTrip == true) {
                        context
                            .read<AddRemoveCubit>()
                            .removeTrip(widget.placeId);
                      } else {
                        context.read<AddRemoveCubit>().addTrip(widget.placeId);
                      }
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                    heroTag: null,
                    child: Icon(
                      placeByIdModel.data?.placesData?.isFavorite == true
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_outlined,
                      color: ColorsManager.secondPrimary.withOpacity(1),
                    ),
                    onPressed: () {
                      if (placeByIdModel.data?.placesData?.isFavorite == true) {
                        context
                            .read<AddRemoveCubit>()
                            .removeFav(widget.placeId);
                      } else {
                        context.read<AddRemoveCubit>().addFav(widget.placeId);
                      }
                    },
                  ),
                ],
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

class ArtFav extends StatefulWidget {
  const ArtFav({super.key, required this.id});
  final String id;

  @override
  State<ArtFav> createState() => _ArtFavState();
}

class _ArtFavState extends State<ArtFav> {
  @override
  void initState() {
    context.read<ArticleByIdCubit>().getArticleById(widget.id);
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
              return Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    backgroundColor: ColorsManager.primary.withOpacity(1),
                    shape: const CircleBorder(),
                    heroTag: null,
                    child: Icon(
                      articlesById.data?.articlesData?.isFavorite == true
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_outlined,
                      color: ColorsManager.secondPrimary.withOpacity(1),
                    ),
                    onPressed: () {
                      if (articlesById.data?.articlesData?.isFavorite == true) {
                        context.read<ArtAddRemoveCubit>().removeFav(widget.id);
                      } else {
                        context.read<ArtAddRemoveCubit>().addFav(widget.id);
                      }
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
