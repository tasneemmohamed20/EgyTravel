import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/grid_card.dart';
import 'package:flutter/material.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({super.key, required this.placesData});
  final List<PlacesData?> placesData;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.all(6),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: placesData.length > 4 ? 4 : items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlacesDetailsScreen(
                      placeId: placesData[index]?.placeId ?? '',
                      recommendedId: placesData[index]?.id ?? 0,
                      lat: placesData[index]?.latitude ?? 0,
                      long: placesData[index]?.longitude ?? 0,
                      image: placesData[index]?.image ?? '',
                      subtitle: placesData[index]?.location ?? '',
                      title: placesData[index]?.name ?? '',
                      description: [placesData[index]?.description ?? ''])),
            ),
            child: CustomGridCard(
              image: [placesData[index]?.image ?? ''],
              title: placesData[index]?.name ?? '',
              subtitle: placesData[index]?.location ?? '',
              imageWidth: mQwidth * 0.4,
              cardColor: ColorsManager.secondPrimary.withOpacity(1),
              titleColor: ColorsManager.primary.withOpacity(1),
              subtitleColor: ColorsManager.subTitle,
            ),
          );
        },
      ),
    );
  }
}
