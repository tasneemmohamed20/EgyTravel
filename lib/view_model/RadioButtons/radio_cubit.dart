// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'radio_state.dart';

// class RadioButtonCubit extends Cubit<RadioButtonState> {
//   RadioButtonCubit() : super(RadioButtonSelected());
//   int selected = -1;

//   selectedRadio(indexx) {
//     selected = indexx;
//     emit(RadioButtonSelected());
//   }
// }

// import 'dart:ui';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// part 'radio_state.dart';

// class RadioButtonCubit extends Cubit<RadioButtonState> {
//   RadioButtonCubit() : super(RadioButtonSelected(locale: const Locale('en', 'US')));
//   String selected = "";

//  void selectRadio(String newValue) {
//     Locale locale;
//     switch (newValue) {
//       case 'English':
//         locale = const Locale('en', 'US');
//         break;
//       case 'Arabic':
//         locale = const Locale('ar', 'AE');
//         break;
//       default:
//         locale = const Locale('en', 'US');
//         break;
//     }
//     selected = newValue;
//     emit(RadioButtonSelected(locale: locale));
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

part 'radio_state.dart';

class RadioButtonCubit extends Cubit<RadioButtonState> {
  RadioButtonCubit() : super(RadioButtonInitial());

  int selected = -1;
  Locale locale = const Locale('en', 'US');

  void selectRadio(int index, BuildContext context) {
    selected = index;
    _changeLocale(index, context);
    emit(RadioButtonChanged(selected));
  }

  void _changeLocale(int index, BuildContext context) {
    if (index == 0) {
     context.setLocale(const Locale('en', 'US'));
     locale = context.locale;

    } else if (index == 1) {
      context.setLocale(const Locale('ar', 'AE'));
      locale = context.locale;
      
    }
  }
}
