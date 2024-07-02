import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/articles_details.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class AllArticlesW extends StatefulWidget {
  const AllArticlesW({
    super.key,
    this.data,
    this.scrollController,
  });

  final List<ArticlesData?>? data;
  final ScrollController? scrollController; // Store the scroll controller

  @override
  State<AllArticlesW> createState() => _AllArticlesWState();
}

class _AllArticlesWState extends State<AllArticlesW> {
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
                  builder: (context) => ArticlesDetailsScreen(
                    id: widget.data![index]?.id?? '',
                      description: widget.data![index]?.description ?? [],
                      image: widget.data![index]?.image ?? '',
                      title: widget.data![index]?.title ?? ''),
                ),
              ),
              child: CustomListCard(
                image: [widget.data![index]?.image ?? ''],
                title: widget.data![index]?.title ?? '',
                subtitle: '',
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
