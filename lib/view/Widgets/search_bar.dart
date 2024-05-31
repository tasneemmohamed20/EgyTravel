import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
  final Color backgroundColor;
  final double borderRadius;
  final String hintText;
  final double width;
  final double height;

  const CustomSearchBar({super.key, 
    required this.searchController,
    required this.onChanged,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white70,
    this.borderRadius = 15.0,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 25),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
