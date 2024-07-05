import "package:easy_localization/easy_localization.dart";
import "package:egy_travel/view/Widgets/shared_appbar.dart";
import "package:egy_travel/res/colors_manager.dart";
import "package:egy_travel/view/Widgets/all_places_widget.dart";
import "package:egy_travel/view_model/PlacesCubit/places_cubit.dart";
import "package:egy_travel/view_model/PlacesCubit/places_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ViewAllPlaces extends StatefulWidget {
  const ViewAllPlaces({super.key});

  @override
  ViewAllPlacesState createState() => ViewAllPlacesState();
}

class ViewAllPlacesState extends State<ViewAllPlaces> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
      context.read<PlacesCubit>().getAllPlaces(context.locale.languageCode);
    });
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final threshold = maxScroll * 0.8; // 80% of the maximum scroll extent

    if (currentScroll >= threshold) {
      context.read<PlacesCubit>().loadMorePlaces();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: CustomAppBar(
          title: "Places".tr(),
          enableBack: false,
          leading: backButton(context),
        ),
        body: BlocBuilder<PlacesCubit, PlacesState>(
          builder: (context, state) {
            return state.maybeWhen(
              getPlacesSuccess: (places, isLastPage) => AllPlacesW(
                data: places,
                scrollController: _scrollController,
              ),
              getPlacesloading: () =>
              const Center(child: CircularProgressIndicator()),
              getPlacesError: (errorHandler) {
                return Center(child: Text(errorHandler.apiErrorModel.message!));
              }, // Display error message
              orElse: () => const SizedBox(), // Handle other states (initial)
            );
          },
        ),
      ),
    );
  }
}
