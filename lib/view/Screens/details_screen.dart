import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/Data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            // image container
            height: mQheight * 2 / 5,
            width: mQwidth,
            child: Image.asset(
              items[1]['image'],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            // main text
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 50, bottom: 8),
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
                    // SizedBox(
                    //   height: mQheight * 0.1,
                    // ),
                    Text(
                      loremIpsum(words: 400),
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
                            text: '${items[1]['title'] + '\n'}',
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
                                items[1]['subtitle'],
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
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: Image.asset(
            Assets.images4,
            scale: 8,
          ),
          fabSize: ExpandableFabSize.regular,
          // foregroundColor: Colors.amber,
          backgroundColor: ColorsManager.primary.withOpacity(1),
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: Icon(
            Icons.close_rounded,
            color: ColorsManager.secondPrimary.withOpacity(1),
          ),
          fabSize: ExpandableFabSize.regular,
          // foregroundColor: Colors.deepOrangeAccent,
          backgroundColor: ColorsManager.primary.withOpacity(1),
          shape: const CircleBorder(),
        ),
        duration: const Duration(milliseconds: 300),
        type: ExpandableFabType.up,
        distance: 80.0,
        children: [
          FloatingActionButton(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            shape: const CircleBorder(),
            heroTag: null,
            child: Icon(
              Icons.location_on_outlined,
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            shape: const CircleBorder(),
            heroTag: null,
            child: Icon(
              Icons.bookmark_add_outlined,
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            shape: const CircleBorder(),
            heroTag: null,
            child: Icon(
              Icons.favorite_border_outlined,
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
