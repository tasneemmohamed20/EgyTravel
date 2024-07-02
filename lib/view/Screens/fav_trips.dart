import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:egy_travel/view_model/FavCubit/cubit/favorites_cubit.dart';
import 'package:egy_travel/view_model/FavCubit/cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavTrips extends StatelessWidget {
  const FavTrips({super.key});

  @override
  Widget build(BuildContext context) {
    var mQwidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<FavCubit>()..getFavorites(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        body: BlocBuilder<FavCubit, FavState>(
          buildWhen: (previous, current) =>
              current is Favloading ||
              current is FavSuccess ||
              current is FavError,
          builder: (context, state) {
            return state.maybeWhen(
              favloading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              favSuccess: (getFavourites) {
                var data = getFavourites.data!.favoritePlaces;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: false,
                    // controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: mQwidth * 0.9,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacesDetailsScreen(
                                placeId: data[index].placeId ?? '',
                                recommendedId: data[index].id ?? 0,
                                lat: data[index].latitude ?? 0,
                                long: data[index].longitude ?? 0,
                                description: [data[index].description ?? ''],
                                image: data[index].image ?? '',
                                subtitle: data[index].location ?? '',
                                title: data[index].name ?? '',
                              ),
                            ),
                          ),
                          child: CustomListCard(
                            image: [data[index].image ?? ''],
                            subtitle: data[index].location ?? '',
                            title: data[index].name ?? '',
                            imageWidth: mQwidth * 0.4,
                            cardColor:
                                ColorsManager.secondPrimary.withOpacity(1),
                            titleColor: ColorsManager.primary.withOpacity(1),
                            subtitleColor: ColorsManager.subTitle,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              favError: (error) {
                return Center(
                  child: Text(error.apiErrorModel.message ?? ''),
                );
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      )),
    );
  }
}
