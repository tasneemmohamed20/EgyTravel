import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/FilterBarCubit/filter_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/Screens/FilterBar/FilterBarCubit/filter_bar_cubit.dart';

class FastFilterBarC extends StatelessWidget {
  FastFilterBarC({super.key});
  final categories = [
    'Leisure',
    'Sports',
    'Cultural',
    'Ecotourism',
    'Religious',
  ];
  // int selectedIndex = -1;
  // String selectedItemText = '';
  // String getSelectedItemText(int index) {
  //   switch (index) {
  //     case -1:
  //       return '';
  //     case 0:
  //       return 'Text 1';
  //     case 1:
  //       return 'Text 2';
  //     case 2:
  //       return 'Text 3';
  //     case 3:
  //       return 'Text 4';
  //     case 4:
  //       return 'Text 5';
  //     case 5:
  //       return 'Text 6';
  //     case 6:
  //       return 'Text 7';
  //     case 7:
  //       return 'Text 8';
  //     case 8:
  //       return 'Text 9';
  //     default:
  //       return '';
  //   }
  // }
  // final int indexxx = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FilterBarCubit, FilterBarState>(builder: (context, state) {
          int selectedIndex = -1;
          if (state is FilterBarSelectState) {
            selectedIndex = state.selectedIndex;
          }
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FilterChip(
                        label: Text(
                          categories[index],
                          style: TextStyle(color: ColorsManager.subTitle),
                        ),
                        selected: selectedIndex == index,
                        onSelected: (selected) {
                          context.read<FilterBarCubit>().selectFilterBar(index);
                        },
                        color: MaterialStateProperty.resolveWith(
                          (states) =>
                              ColorsManager.secondPrimary.withOpacity(1),
                        ),
                        selectedColor: Colors.red,
                        showCheckmark: false,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        }),
      ],
    );
  }
}
