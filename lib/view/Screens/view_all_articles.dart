import "package:easy_localization/easy_localization.dart";
import "package:egy_travel/model/Home/ArticlesModels/articles_response.dart";
import "package:egy_travel/view/Widgets/all_articles_widget.dart";
import "package:egy_travel/view/Widgets/shared_appbar.dart";
import "package:egy_travel/res/colors_manager.dart";
import "package:egy_travel/view_model/ArticlesCubit/cubit/articles_cubit.dart";
import "package:egy_travel/view_model/ArticlesCubit/cubit/articles_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ViewAllArticles extends StatefulWidget {
  const ViewAllArticles({
    super.key,
  });

  @override
  ViewAllArticlesState createState() => ViewAllArticlesState();
}

class ViewAllArticlesState extends State<ViewAllArticles> {
  final ScrollController _scrollController = ScrollController();
  final List<ArticlesData?> articles = [];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ArticlesCubit>().getAllArticles();
  }

  // void _onScroll() {
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent * 0.8) {
  //     context.read<PlacesCubit>().loadMorePlaces();
  //   }
  // }
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final threshold = maxScroll * 0.8; // 80% of the maximum scroll extent

    if (currentScroll >= threshold) {
      // Trigger to load more data
      // context.read<ArticlesCubit>().loadMorePlaces();
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
          title: "Articles".tr(),
          enableBack: false,
          leading: backButton(context),
        ),
        body: BlocBuilder<ArticlesCubit, ArticleState>(
          buildWhen: (previous, current) =>
              current is GetArticlesloading ||
              current is GetArticlesSuccess ||
              current is GetArticlesError,
          builder: (context, state) {
            return state.maybeWhen(
              getArticlesloading: () =>
                  const Center(child: CircularProgressIndicator()),
              getArticlesSuccess: (articlesResponseModel) {
                return AllArticlesW(
                  data: articlesResponseModel.data!.articlesData,
                );
              },

              getArticlesError: (errorHandler) {
                return Text(errorHandler.apiErrorModel.message!);
              }, // Display error message
              orElse: () => const SizedBox(
                child: Text('No Data'),
              ), // Handle other states (initial)
            );
          },
        ),
      ),
    );
  }
}
