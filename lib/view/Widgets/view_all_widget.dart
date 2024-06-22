import 'package:egy_travel/model/Home/places_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class ViewAllW extends StatefulWidget {
  const ViewAllW({
    super.key,
    this.screenTitle,
    this.data,
    this.scrollController,
  });

  final String? screenTitle;
  final List<PlacesData?>? data;
  final ScrollController? scrollController; // Store the scroll controller

  @override
  State<ViewAllW> createState() => _ViewAllWState();
}

class _ViewAllWState extends State<ViewAllW> {
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
      padding: const EdgeInsets.symmetric(
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
                    description:
                        widget.data![index]?.description as List<String>? ?? [],
                    image: widget.data![index]?.image ?? '',
                    subtitle: widget.data![index]?.location ?? '',
                    title: widget.data![index]?.name ?? '',
                  ),
                ),
              ),
              child: CustomListCard(
                image: widget.data![index]?.image ?? '',
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
