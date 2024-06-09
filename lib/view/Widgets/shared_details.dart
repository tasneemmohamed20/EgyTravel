import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class SharedDetials extends StatelessWidget {
  const SharedDetials({
    super.key,
    required this.items,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });
  final List<Map<String, dynamic>> items;
  final String image;
  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: mQheight * 2 / 5,
          width: mQwidth,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 8),
            height: mQheight * 5.2 / 8,
            width: mQwidth,
            decoration: BoxDecoration(
                color: ColorsManager.secondPrimary.withOpacity(1),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    description,
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
        Center(
          child: SizedBox(
            height: 200,
            child: Container(
                // color: Colors.amber,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title\n',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(height: 32)),
                        WidgetSpan(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 16,
                              ),
                            ),
                            Text(
                              subtitle,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ))
                      ],
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
