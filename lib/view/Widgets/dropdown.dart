import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  String? selectedOption;
  final String? hint;
  final List<String> items;
  final List<String> language = ['Arabic', 'English'];
  VoidCallbackAction? ontap;
  CustomDropdown({
    super.key,
    this.selectedOption,
    required this.items,
    this.hint,
    this.ontap,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconSize: MediaQuery.of(context).size.width * 0.1,
      hint: Text(
        widget.hint ?? "SelectOption".tr(),
        style: const TextStyle(color: Colors.white70),
      ),
      value: widget.selectedOption,
      onChanged: (String? newValue) {
        if (newValue != null) {
          switch (newValue) {
            case 'English':
              context.setLocale(const Locale('en', 'US'));
              break;
            case 'Arabic':
              context.setLocale(const Locale('ar', 'AE'));
              break;
            default:
              break;
          }
        }
        setState(() {
          widget.selectedOption = newValue;
        });
      },
      icon: widget.selectedOption != null
          ? Icon(
              Icons.check,
              size: 24,
              color: ColorsManager.secondPrimary,
            )
          : null,
      borderRadius: BorderRadius.circular(16),
      underline: Container(
        height: 2,
        color: ColorsManager.secondPrimary,
      ),
      dropdownColor: ColorsManager.primary.withOpacity(1),
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }
}
