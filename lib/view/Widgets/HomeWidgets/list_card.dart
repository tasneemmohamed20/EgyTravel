import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  final List<String> image;
  final String title;
  final String subtitle;
  final double imageWidth;
  final Color cardColor;
  final Color titleColor;
  final Color subtitleColor;

  const CustomListCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.imageWidth,
    required this.cardColor,
    required this.titleColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: cardColor,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: imageWidth,
                height: imageWidth,
                child: CachedNetworkImage(
                  imageUrl: image[0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholderFadeInDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 16),
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: subtitleColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
