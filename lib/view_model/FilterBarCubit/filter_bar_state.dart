part of 'filter_bar_cubit.dart';

@immutable
abstract class FilterBarState {}
class FilterBarInitial extends FilterBarState {}

class FilterBarSelectState extends FilterBarState {final int selectedIndex;
  final String selectedItem;
    FilterBarSelectState(this.selectedIndex, this.selectedItem);
}
// class FilterBarTextState extends FilterBarState {}