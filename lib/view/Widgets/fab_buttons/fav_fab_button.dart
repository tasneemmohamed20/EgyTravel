// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/colors_manager.dart';
import '../../../view_model/PlacesAddRemove/cubit/add_remove_cubit.dart';
import '../../../view_model/PlacesAddRemove/cubit/add_remove_state.dart';

class FavFabButton extends StatelessWidget {
  final String placeId;
  bool isFav;
  FavFabButton({super.key, required this.placeId, required this.isFav});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRemoveCubit, AddRemoveState>(
                    bloc: context.read<AddRemoveCubit>(),
                    builder: (context, state) {
                      return state.maybeWhen(
                          addFavLoading: () => FloatingActionButton(
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
                          addFavError: (error) => FloatingActionButton(
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
                          addFavSuccess: (addRemoveResponseModel) {
                           if (addRemoveResponseModel
                                .data!.userData!.favoritePlaces!
                                .contains(placeId)) {
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
                                      .read<AddRemoveCubit>()
                                      .removeFav(placeId);
                                } else {
                                  context
                                      .read<AddRemoveCubit>()
                                      .addFav(placeId);
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
                                      .read<AddRemoveCubit>()
                                      .removeFav(placeId);
                                } else {
                                  context
                                      .read<AddRemoveCubit>()
                                      .addFav(placeId);
                                }
                              },
                            );
                          });
                    },
                  );
  }
}