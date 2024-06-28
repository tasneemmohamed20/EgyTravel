// import 'package:egy_travel/model/Home/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
// import 'package:egy_travel/view/Widgets/all_places_widget.dart';
// import 'package:egy_travel/view/Widgets/fast_filter_bar.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_cubit.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, this.recommendedID});
  final _searchController = TextEditingController();
  final recommendedID;
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          appBar: CustomAppBar(
            title: 'Search',
            enableBack: false,
            leading: backButton(context),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: CustomSearchBar(
                readOnly: false,
                searchController: _searchController,
                onSubmitted: (value) =>
                    context.read<SearchCubit>().searchPlaces(value.toString()),
                width: mQwidth * 0.9,
                height: mQheight * 0.07,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
                return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (placesData) {
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: false,
                        // controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: placesData!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: mQwidth * 0.9,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlacesDetailsScreen(
                                    recommendedId: placesData![index]?.id ?? 0,
                                    lat: placesData![index]?.latitude ?? 0,
                                    long: placesData![index]?.longitude ?? 0,
                                    description: placesData![index]?.description
                                            as List<String>? ??
                                        [],
                                    image: placesData![index]?.image ?? '',
                                    subtitle: placesData[index]?.location ?? '',
                                    title: placesData[index]?.name ?? '',
                                  ),
                                ),
                              ),
                              child: CustomListCard(
                                image: [placesData[index]?.image ?? ''],
                                subtitle: placesData![index]?.location ?? '',
                                title: placesData![index]?.name ?? '',
                                imageWidth: mQwidth * 0.4,
                                cardColor:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                titleColor:
                                    ColorsManager.primary.withOpacity(1),
                                subtitleColor: ColorsManager.subTitle,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (message) => Center(
                          child: Text(message),
                        ),
                    orElse: () => const SizedBox.shrink());
              })
            ],
          )),
    );
  }
}
