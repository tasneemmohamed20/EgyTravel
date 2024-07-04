import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 25,
                color: ColorsManager.secondPrimary.withOpacity(1),
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Text(
            value,
            softWrap: true,
            // textAlign: TextAlign.start,

            style: TextStyle(

                fontSize: 20,
                color: ColorsManager.secondPrimary.withOpacity(1),
                fontWeight: FontWeight.w500),
          ),
        ),
        
      ],
    );
  }
}
