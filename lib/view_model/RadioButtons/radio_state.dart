// part of 'radio_cubit.dart';

// @immutable
// abstract class RadioButtonState {}

// class RadioButtonSelected extends RadioButtonState {}

part of 'radio_cubit.dart';

@immutable
abstract class RadioButtonState {}

class RadioButtonInitial extends RadioButtonState {}

class RadioButtonChanged extends RadioButtonState {
  final int selectedIndex;
  RadioButtonChanged(this.selectedIndex);
}
