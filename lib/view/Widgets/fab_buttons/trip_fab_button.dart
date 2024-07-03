// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/colors_manager.dart';
import '../../../view_model/PlacesAddRemove/cubit/add_remove_cubit.dart';
import '../../../view_model/PlacesAddRemove/cubit/add_remove_state.dart';

class TripFabButton extends StatelessWidget {
  final String placeId;
  bool isTrip;
  TripFabButton({super.key, required this.placeId, required this.isTrip});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRemoveCubit, AddRemoveState>(
      bloc: context.read<AddRemoveCubit>(),
      builder: (context, state) {
        return state.maybeWhen(
            addTripLoading: () => FloatingActionButton(
                  backgroundColor: ColorsManager.primary.withOpacity(1),
                  shape: const CircleBorder(),
                  heroTag: null,
                  child: Icon(
                    isTrip == true
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_add_outlined,
                    color: ColorsManager.secondPrimary.withOpacity(1),
                  ),
                  onPressed: () {},
                ),
            addTripError: (error) => FloatingActionButton(
                  backgroundColor: ColorsManager.primary.withOpacity(1),
                  shape: const CircleBorder(),
                  heroTag: null,
                  child: Icon(
                    isTrip == true
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_add_outlined,
                    color: ColorsManager.secondPrimary.withOpacity(1),
                  ),
                  onPressed: () {},
                ),
            addTripSuccess: (addRemoveResponseModel) {
              if (addRemoveResponseModel.data!.userData!.userTrips!
                  .contains(placeId)) {
                isTrip = true;
              } else {
                isTrip = false;
              }
              return FloatingActionButton(
                backgroundColor: ColorsManager.primary.withOpacity(1),
                shape: const CircleBorder(),
                heroTag: null,
                child: Icon(
                  isTrip == true
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_add_outlined,
                  color: ColorsManager.secondPrimary.withOpacity(1),
                ),
                onPressed: () {
                  if (isTrip == true) {
                    context.read<AddRemoveCubit>().removeTrip(placeId);
                  } else {
                    context.read<AddRemoveCubit>().addTrip(placeId);
                  }
                },
              );
            },
            orElse: () {
              return FloatingActionButton(
                backgroundColor: ColorsManager.primary.withOpacity(1),
                shape: const CircleBorder(),
                heroTag: null,
                child: Icon(
                  isTrip == true
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_add_outlined,
                  color: ColorsManager.secondPrimary.withOpacity(1),
                ),
                onPressed: () {
                  if (isTrip == true) {
                    context.read<AddRemoveCubit>().removeTrip(placeId);
                  } else {
                    context.read<AddRemoveCubit>().addTrip(placeId);
                  }
                },
              );
            });
      },
    );
  }
}
