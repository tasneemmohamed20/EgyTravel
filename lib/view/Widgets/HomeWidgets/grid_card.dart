import 'package:cached_network_image/cached_network_image.dart';
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
                  child: CachedNetworkImage(
                    imageUrl: image[0],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholderFadeInDuration:
                        const Duration(milliseconds: 500),
                  )),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: (subtitle == "") ? 16 : 4, horizontal: 4),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.clip, //! HERE
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
