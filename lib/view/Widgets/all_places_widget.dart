import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class AllPlacesW extends StatefulWidget {
  const AllPlacesW({
    super.key,
    this.data,
    this.scrollController,
  });

  final List<PlacesData?>? data;
  final ScrollController? scrollController; // Store the scroll controller

  @override
  State<AllPlacesW> createState() => _AllPlacesWState();
}

class _AllPlacesWState extends State<AllPlacesW> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMoreData);
  }

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
      ),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: widget.data!.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: mQwidth * 0.9,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacesDetailsScreen(
                    placeId: widget.data![index]?.placeId ?? '',
                    recommendedId: widget.data![index]?.id ?? 0,
                    lat: widget.data![index]?.latitude ?? 0,
                    long: widget.data![index]?.longitude ?? 0,
                    description: [widget.data![index]?.description ?? ''],
                    image: widget.data![index]?.image ?? '',
                    subtitle: widget.data![index]?.location ?? '',
                    title: widget.data![index]?.name ?? '',
                  ),
                ),
              ),
              child: CustomListCard(
                image: [widget.data![index]?.image ?? ''],
                subtitle: widget.data![index]?.location ?? '',
                title: widget.data![index]?.name ?? '',
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

  void loadMoreData() {
    // Load more data
  }
}
