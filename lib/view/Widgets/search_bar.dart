import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final Color backgroundColor;
  final double borderRadius;
  final double width;
  final double height;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;

  const CustomSearchBar({
    this.onTap,
    super.key,
    this.searchController,
    this.onChanged,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white70,
    this.borderRadius = 15.0,
    required this.readOnly, this.onSubmitted, 
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
                  onSubmitted: onSubmitted,
                  onTap: onTap,
                  readOnly: readOnly,
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search".tr(),
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
