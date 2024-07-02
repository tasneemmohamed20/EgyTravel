import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/view/Screens/search_screen.dart';
import 'package:egy_travel/view/Screens/view_all_articles.dart';
import 'package:egy_travel/view/Screens/view_all_places.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/articles_gridview.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/may_like_list.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/places_gridview.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/home_drawer.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/sliver_appbar.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/ArticlesCubit/cubit/articles_cubit.dart';
import 'package:egy_travel/view_model/ArticlesCubit/cubit/articles_state.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_cubit.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_state.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _changeLanguage(context.locale);
    });
  }

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _changeLanguage(Locale newLocale) async {
    await context.setLocale(newLocale); // Update the locale
    setState(() {}); // Rebuild the widget after locale change
  }

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;

    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return SafeArea(
            child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<PlacesCubit>()..getAllPlaces(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        getIt<ArticlesCubit>()..getAllArticles(),
                  ),
                ],
                child: Scaffold(
                  key: _scaffoldKey,
                  extendBody: true,
                  resizeToAvoidBottomInset: false,
                  backgroundColor: ColorsManager.primary.withOpacity(1),
                  drawer: MainDrawer(),
                  body: snapshot.data == ConnectivityResult.none
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_off,
                                size: 100,
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                              ),
                              Text(
                                  'No internet connection!, please check your connection and try again.',
                                  softWrap: true,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsManager.secondPrimary
                                        .withOpacity(1),
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        )
                      : CustomScrollView(
                          slivers: [
                            CustomSliverAppBar(
                              spcae: 56,
                              leading: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: ColorsManager.primary.withOpacity(1),
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                              ),
                              title: "Home".tr(),
                              expandedHeight: 64.0,
                              // onLeadingPressed: () {
                              //   _scaffoldKey.currentState?.openDrawer();
                              // },
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
                                            builder: (context) => BlocProvider(
                                                  create: (context) =>
                                                      getIt<SearchCubit>(),
                                                  child: const SearchScreen(),
                                                )),
                                      ),
                                      readOnly: true,
                                      width: mQwidth * 0.9,
                                      height: mQheight * 0.07,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 32),
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        "YouMayLike".tr(),
                                        style: TextStyle(
                                          color: ColorsManager.secondPrimary
                                              .withOpacity(1),
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
                                      return state.maybeWhen(
                                          getPlacesloading: () {
                                        return const SizedBox(
                                            height: 100,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()));
                                      }, getPlacesSuccess:
                                              (placesList, isLastPage) {
                                        return Column(
                                          children: [
                                            MayLikeList(
                                              placesData: placesList,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(
                                                      start: 32,
                                                      top: 16,
                                                      end: 32),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Places".tr(),
                                                      style: TextStyle(
                                                        color: ColorsManager
                                                            .secondPrimary
                                                            .withOpacity(1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BlocProvider(
                                                                  create: (context) =>
                                                                      getIt<
                                                                          PlacesCubit>(),
                                                                  child:
                                                                      const ViewAllPlaces(),
                                                                )),
                                                      ),
                                                      child: Text(
                                                        "ViewAll".tr(),
                                                        style: TextStyle(
                                                          color: ColorsManager
                                                              .secondPrimary
                                                              .withOpacity(1),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            PlacesGridView(
                                              placesData: placesList,
                                            ),
                                          ],
                                        );
                                      }, getPlacesError: (errorHandler) {
                                        return Text(errorHandler
                                            .apiErrorModel.message!);
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
                                                  builder: (context) =>
                                                      BlocProvider(
                                                        create: (context) =>
                                                            getIt<
                                                                ArticlesCubit>(),
                                                        child:
                                                            const ViewAllArticles(),
                                                      )),
                                            ),
                                            child: Text(
                                              "ViewAll".tr(),
                                              style: TextStyle(
                                                color: ColorsManager
                                                    .secondPrimary
                                                    .withOpacity(1),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<ArticlesCubit, ArticleState>(
                                    buildWhen: (previous, current) =>
                                        current is GetArticlesloading ||
                                        current is GetArticlesSuccess ||
                                        current is GetArticlesError,
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                          getArticlesloading: () {
                                        return const SizedBox(
                                            height: 100,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()));
                                      }, getArticlesSuccess:
                                              (articlesResponseModel) {
                                        var articlesList = articlesResponseModel
                                            .data!.articlesData;
                                        return ArticlesGridView(
                                          articlesData: articlesList ?? [],
                                        );
                                      }, getArticlesError: (errorHandler) {
                                        return Text(errorHandler
                                            .apiErrorModel.message!);
                                      }, orElse: () {
                                        return const SizedBox.shrink();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                )),
          );
        });
  }
}
