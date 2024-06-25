import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:flutter/material.dart';

class EventsDetails extends StatelessWidget {
  final String name;
  final String startDate;
  final String endDate;
  final String description;
  final String location;
  final List<String> image;
  const EventsDetails(
      {super.key,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.description,
      required this.location,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: name,
          enableBack: false,
          leading: backButton(context),
        ),
        backgroundColor: ColorsManager.primary.withOpacity(1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.secondPrimary.withOpacity(1),
                    width: 2.0,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image(fit: BoxFit.cover, image: NetworkImage(image[0])),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.event_available,
                              size: 16,
                            ),
                          ),
                          Text(
                            'Start at:',
                            style: TextStyle(
                              color: ColorsManager.secondPrimary.withOpacity(1),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 16,
                            ),
                          ),
                          Text(location)
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 32),
                        child: Text(
                          startDate,
                          style: TextStyle(
                            color: ColorsManager.secondPrimary.withOpacity(1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.event_busy,
                              size: 16,
                            ),
                          ),
                          Text(
                            'End at: ',
                            style: TextStyle(
                              color: ColorsManager.secondPrimary.withOpacity(1),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 32),
                        child: Text(
                          endDate,
                          style: TextStyle(
                            color: ColorsManager.secondPrimary.withOpacity(1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: ColorsManager.secondPrimary.withOpacity(1),
                thickness: 0.5,
                indent: MediaQuery.of(context).size.width * 0.1,
                endIndent: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 16.0, horizontal: 16),
                  child: Text(
                    description,
                    softWrap: true,
                    style: TextStyle(
                      color: ColorsManager.secondPrimary.withOpacity(1),
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.justify,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
