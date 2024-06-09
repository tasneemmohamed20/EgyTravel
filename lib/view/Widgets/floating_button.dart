import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class CustomFloatButtton extends StatelessWidget {
  const CustomFloatButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
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
    );
  }
}
