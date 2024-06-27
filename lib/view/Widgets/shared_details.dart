import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class SharedDetials extends StatelessWidget {
  const SharedDetials({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.description,
  });
  final String image;
  final String title;
  final String? subtitle;
  final List<String> description;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: mQheight * 2 / 5,
          width: mQwidth,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: mQheight * 2 / 5 - 50,
          child: Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 8),
            height: mQheight * 3 / 5,
            width: mQwidth,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.primary
                        .withOpacity(0.2), // Adjust the color and opacity
                    blurRadius: 10, // Blur radius
                    offset: const Offset(0, 4), // changes position of shadow
                  )
                ],
                color: ColorsManager.secondPrimary.withOpacity(1),
                borderRadius: const BorderRadius.all(Radius.circular(32))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < description.length; i++)
                    Text(
                      description[i],
                      softWrap: true,
                      style: TextStyle(
                        color: ColorsManager.primary.withOpacity(1),
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          // title & location
          bottom: mQheight * 3 / 5,
          right: 0,
          left: 0,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: mQwidth * 0.8,
                height: mQheight * 0.1,
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          WidgetSpan(
                              child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01)),
                          if (subtitle?.isNotEmpty ?? false)
                            WidgetSpan(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      subtitle ?? '',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
