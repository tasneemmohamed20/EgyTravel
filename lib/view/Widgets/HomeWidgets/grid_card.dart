import 'package:flutter/material.dart';

class CustomGridCard extends StatelessWidget {
  final List<String> image;
  final String title;
  final String? subtitle;
  final double imageWidth;
  final BorderRadiusGeometry borderRadius;
  final Color elevationColor;
  final Color cardColor;
  final Color titleColor;
  final Color subtitleColor;

  const CustomGridCard({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.imageWidth,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.elevationColor = Colors.white,
    required this.cardColor,
    required this.titleColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 4.0,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              width: imageWidth,
              height: imageWidth,
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Image.network(
                  image[0],
                  fit: BoxFit.cover,
                  height: imageWidth,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: (subtitle == "") ? 16 : 4, horizontal: 4),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (subtitle?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
                child: Text(
                  subtitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: subtitleColor,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
