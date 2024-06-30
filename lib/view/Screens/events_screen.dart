import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/events_details.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:egy_travel/view/Widgets/sliver_appbar.dart';
import 'package:egy_travel/view_model/EventsCubit/cubit/events_cubit.dart';
import 'package:egy_travel/view_model/EventsCubit/cubit/events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<EventsCubit>()..getAllEvents(),
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              spcae: 0,
              title: "Events".tr(),
              expandedHeight: 64.0,
            ),
            BlocBuilder<EventsCubit, EventsState>(
              buildWhen: (previous, current) =>
                  current is GetEventsloading ||
                  current is GetEventsSuccess ||
                  current is GetEventsError,
              builder: (context, state) {
                return state.maybeWhen(getEventsloading: () {
                  return const SliverToBoxAdapter(
                    child: SizedBox(
                        child: Center(child: CircularProgressIndicator())),
                  );
                }, getEventsSuccess: (eventsResponseModel) {
                  var eventsList = eventsResponseModel.data!.eventsData;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16.0,
                          ),
                          child: SizedBox(
                            width: mQwidth * 0.9,
                            height: mQheight * 0.2,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventsDetails(
                                          name: eventsList[index].name ?? '',
                                          startDate:
                                              eventsList[index].startAt ?? '',
                                          endDate:
                                              eventsList[index].endAt ?? '',
                                          description:
                                              eventsList[index].description ??
                                                  '',
                                          location:
                                              eventsList[index].location ?? '',
                                          image: eventsList[index].images ?? [],
                                        )),
                              ),
                              child: CustomListCard(
                                image: eventsList[index].images ?? [],
                                title: eventsList[index].name ?? '',
                                subtitle: eventsList[index].location ?? '',
                                imageWidth: mQwidth * 0.4,
                                cardColor:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                titleColor:
                                    ColorsManager.primary.withOpacity(1),
                                subtitleColor: ColorsManager.subTitle,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: eventsList!.length,
                    ),
                  );
                },
                getEventsError: (errorHandler) =>   Text(errorHandler.apiErrorModel.message ?? ''),
                
                 orElse: () {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}
