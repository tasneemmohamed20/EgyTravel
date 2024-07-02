import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_cubit.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        context.read<SearchCubit>().clearPlaces();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(() {});
    _searchController.dispose();
    super.dispose();
  }

  final _searchController = TextEditingController();

  final List<String> categories = [
    'All',
    'Ecotourism',
    'Religious',
    'Cultural',
    'Leisure',
    'Medical',
    'Sports',
  ];
  final List<String> categoriesId = [
    '',
    '65f504187bd323b0249c51e0',
    '6619a09681b958670554951b',
    '65f5041c7bd323b0249c51e2',
    '65f504237bd323b0249c51e4',
    '65f504277bd323b0249c51e6',
    '65f5042a7bd323b0249c51e8',
  ];

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
                  onSubmitted: (value) {
                    if (_searchController.text != '') {
                      context
                          .read<SearchCubit>()
                          .searchPlaces(value.toString(), categoriesId[0]);
                    }
                  },
                  width: mQwidth * 0.9,
                  height: mQheight * 0.07,
                )),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            checkmarkColor:
                                ColorsManager.primary.withOpacity(1),
                            label: Text(
                              categories[index],
                              style: TextStyle(
                                  color: ColorsManager.primary.withOpacity(1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            selected:
                                context.read<SearchCubit>().cubitIndex == index,
                            color: MaterialStateProperty.all<Color>(
                                ColorsManager.secondPrimary),
                            selectedColor: Colors.white.withOpacity(0.1),
                            onSelected: (selected) {
                              setState(() {
                                context.read<SearchCubit>().cubitIndex =
                                    selected ? index : 0;
                                if (_searchController.text != '') {
                                  context.read<SearchCubit>().searchPlaces(
                                      _searchController.text,
                                      categoriesId[context
                                          .read<SearchCubit>()
                                          .cubitIndex]);
                                }
                                selected = false;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (placesData) {
                        var places = placesData.data!.placesData;
                        return Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16.0,
                          ),
                          child: ListView.builder(
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
                                        placeId: places[index].placeId ?? '',
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
                          ),
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
