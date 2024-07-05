import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class AllPlacesW extends StatelessWidget {
  final List<PlacesData?>? data;
  final ScrollController? _scrollController;

  const AllPlacesW({
    super.key,
    required this.data,
    required ScrollController? scrollController,
  }) : _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
        vertical: 6,
      ),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        controller: _scrollController,
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
                    placeId: data![index]?.placeId ?? '',
                    recommendedId: data![index]?.id ?? 0,
                    lat: data![index]?.latitude ?? 0,
                    long: data![index]?.longitude ?? 0,
                    description: [data![index]?.description ?? ''],
                    image: data![index]?.image ?? '',
                    subtitle: data![index]?.location ?? '',
                    title: data![index]?.name ?? '',
                  ),
                ),
              ),
              child: CustomListCard(
                image: [data![index]?.image ?? ''],
                subtitle: data![index]?.location ?? '',
                title: data![index]?.name ?? '',
                imageWidth: mQwidth * 0.4,
                cardColor: ColorsManager.secondPrimary.withOpacity(1),
                titleColor: ColorsManager.primary.withOpacity(1),
                subtitleColor: ColorsManager.subTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}
