import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class MayLikeList extends StatelessWidget {
  const MayLikeList({super.key, required this.placesData});
  final List<PlacesData?> placesData;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
      child: SizedBox(
        height: mQheight * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              placesData.length > 10 ? 10 : items.length, // Change this line
          itemBuilder: (context, index) {
            return SizedBox(
              width: mQwidth * 0.9,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlacesDetailsScreen(
                            placeId: placesData[index]?.placeId?? '',
                            recommendedId: placesData[index]?.id ?? 0,
                            lat: placesData[index]?.latitude ?? 0,
                            long: placesData[index]?.longitude ?? 0,
                            image: placesData[index]?.image ?? '',
                            subtitle: placesData[index]?.location ?? '',
                            title: placesData[index]?.name ?? '',
                            description: [placesData[index]?.description ?? ''],
                          )),
                ),
                child: CustomListCard(
                  image: [placesData[index]?.image ?? ''],
                  title: placesData[index]?.name ?? '',
                  subtitle: placesData[index]?.location ?? '',
                  imageWidth: mQwidth * 0.4,
                  cardColor: ColorsManager.secondPrimary.withOpacity(1),
                  titleColor: ColorsManager.primary.withOpacity(1),
                  subtitleColor: ColorsManager.subTitle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
