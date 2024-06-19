import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  final String image;
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
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
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
