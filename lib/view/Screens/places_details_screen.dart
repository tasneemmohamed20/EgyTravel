import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/floating_button.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/grid_card.dart';
import 'package:egy_travel/view/Widgets/shared_details.dart';
import 'package:egy_travel/view_model/PlacesAddRemove/cubit/add_remove_cubit.dart';
import 'package:egy_travel/view_model/PlaceById/cubit/placeid_cubit.dart';
import 'package:egy_travel/view_model/RecommendedCubit/cubit/recommended_cubit.dart';
import 'package:egy_travel/view_model/RecommendedCubit/cubit/recommended_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class PlacesDetailsScreen extends StatelessWidget {
  const PlacesDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.lat,
      required this.long,
      required this.recommendedId,
      required this.placeId});
  final String image;
  final String title;
  final String subtitle;
  final List<String> description;
  final double lat;
  final double long;
  final int recommendedId;
  final String placeId;
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          getIt<RecommendedCubit>()..getRecommended(recommendedId),
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
                      image: image,
                      subtitle: subtitle,
                      title: title,
                      description: description,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 0, right: 32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          'Recommendations',
                          style: TextStyle(
                            color: ColorsManager.secondPrimary.withOpacity(1),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<RecommendedCubit, RecommendedState>(
                  buildWhen: (previous, current) =>
                      current is GetRecommendedloading ||
                      current is GetRecommendedSuccess ||
                      current is GetRecommendedError,
                  builder: (context, state) {
                    return state.maybeWhen(getRecommendedloading: () {
                      return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()));
                    }, getRecommendedSuccess: (recommendedResponseModel) {
                      var recommended =
                          recommendedResponseModel.recommendations;
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount:
                              recommended.length > 4 ? 4 : recommended.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlacesDetailsScreen(
                                          placeId:
                                              recommended[index].placeId ?? '',
                                          recommendedId:
                                              recommended[index].id ?? 0,
                                          lat: recommended[index].latitude ?? 0,
                                          long:
                                              recommended[index].longitude ?? 0,
                                          image: recommended[index].image ?? '',
                                          subtitle:
                                              recommended[index].location ?? '',
                                          title: recommended[index].name ?? '',
                                          description: [
                                            recommended[index].description ?? ''
                                          ],
                                        )),
                              ),
                              child: CustomGridCard(
                                image: [recommended[index].image!],
                                title: recommended[index].name ?? '',
                                subtitle: recommended[index].location ?? '',
                                imageWidth: mQwidth * 0.4,
                                cardColor:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                titleColor:
                                    ColorsManager.primary.withOpacity(1),
                                subtitleColor: ColorsManager.primary,
                              ),
                            );
                          },
                        ),
                      );
                    }, getRecommendedError: (errorHandler) {
                      return Text(errorHandler.apiErrorModel.message!);
                    }, orElse: () {
                      return const SizedBox.shrink();
                    });
                  },
                )
              ],
            ),
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<PlaceByIdCubit>()..getPlaceById(placeId),
              ),
              BlocProvider(create: (context) => getIt<AddRemoveCubit>()),
            ],
            child: CustomFloatButtton(
              placeId: placeId,
              lat: lat,
              long: long,
            ),
          ),
        ),
      ),
    );
  }
}
