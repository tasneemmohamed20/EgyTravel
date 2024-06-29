// import 'package:egy_travel/model/Home/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_cubit.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _searchController = TextEditingController();
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: CustomSearchBar(
                  readOnly: false,
                  searchController: _searchController,
                  onSubmitted: (value) => context
                      // .read<SearchCubit>()
                      // .searchPlaces(value.toString()),
                 , width: mQwidth * 0.9,
                  height: mQheight * 0.07,
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (placesData) {
                        var places = placesData.data!.placesData;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: places!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: mQwidth * 0.9,
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlacesDetailsScreen(
                                      recommendedId: places[index].id ?? 0,
                                      lat: places[index].latitude ?? 0,
                                      long: places[index].longitude ?? 0,
                                      description: places[index].description
                                              as List<String>? ??
                                          [],
                                      image: places[index].image ?? '',
                                      subtitle: places[index].location ?? '',
                                      title: places[index].name ?? '',
                                    ),
                                  ),
                                ),
                                child: CustomListCard(
                                  image: [places[index].image ?? ''],
                                  subtitle: places[index].location ?? '',
                                  title: places[index].name ?? '',
                                  imageWidth: mQwidth * 0.4,
                                  cardColor: ColorsManager.secondPrimary
                                      .withOpacity(1),
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
            ),
          )),
    );
  }
}
