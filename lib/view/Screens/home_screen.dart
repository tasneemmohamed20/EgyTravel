import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/view/Screens/search_screen.dart';
import 'package:egy_travel/view/Screens/view_all.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/articles_gridview.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/may_like_list.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/places_gridview.dart';
import 'package:egy_travel/view/Widgets/bottom_navbar.dart';
import 'package:egy_travel/view/Widgets/home_drawer.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/sliver_appbar.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_cubit.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// enum _SelectedTab { home, plans, events }

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<PlacesCubit>()..getAllPlaces(),
        child: Scaffold(
            key: _scaffoldKey,
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorsManager.primary.withOpacity(1),
            drawer: const MainDrawer(),
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(
                  title: "Home".tr(),
                  leadingIcon: Icons.menu,
                  expandedHeight: 64.0,
                  onLeadingPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: CustomSearchBar(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()),
                          ),
                          readOnly: true,
                          width: mQwidth * 0.9,
                          height: mQheight * 0.07,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 32),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "YouMayLike".tr(),
                            style: TextStyle(
                              color: ColorsManager.secondPrimary.withOpacity(1),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<PlacesCubit, PlacesState>(
                        buildWhen: (previous, current) =>
                            current is GetPlacesloading ||
                            current is GetPlacesSuccess ||
                            current is GetPlacesError,
                        builder: (context, state) {
                          return state.maybeWhen(getPlacesloading: () {
                            return const SizedBox(
                                height: 100,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }, getPlacesSuccess: (placesResponseModel) {
                            var placesList =
                                placesResponseModel.data!.placesData;
                            return Column(
                              children: [
                                MayLikeList(
                                  placesData: placesList ?? [],
                                ),
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.only(
                                //       start: 32, top: 16, end: 32),
                                //   child: Align(
                                //     alignment: Alignment.topLeft,
                                //     child: Row(
                                //       children: [
                                //         Text(
                                //           "Places".tr(),
                                //           style: TextStyle(
                                //             color: ColorsManager.secondPrimary
                                //                 .withOpacity(1),
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 25,
                                //           ),
                                //         ),
                                //         const Spacer(),
                                //         TextButton(
                                //           onPressed: () => Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) => ViewAll(
                                //                       screenTilte:
                                //                           "Places".tr(),
                                //                     )),
                                //           ),
                                //           child: Text(
                                //             "ViewAll".tr(),
                                //             style: TextStyle(
                                //               color: ColorsManager
                                //                   .secondPrimary
                                //                   .withOpacity(1),
                                //               fontSize: 15,
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                PlacesGridView(
                                  placesData: placesList ?? [],
                                ),
                              ],
                            );
                          }, getPlacesError: (errorHandler) {
                            return Text(errorHandler.apiErrorModel.message!);
                          }, orElse: () {
                            return const SizedBox.shrink();
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 32, top: 16, end: 32),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                "Articles".tr(),
                                style: TextStyle(
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewAll(
                                            screenTilte: "Articles".tr(),
                                          )),
                                ),
                                child: Text(
                                  "ViewAll".tr(),
                                  style: TextStyle(
                                    color: ColorsManager.secondPrimary
                                        .withOpacity(1),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ArticlesGridView(),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar()),
      ),
    );
  }
}
