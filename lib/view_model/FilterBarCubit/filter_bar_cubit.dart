import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_bar_state.dart';

class FilterBarCubit extends Cubit<FilterBarState> {
  // int indexxx = -1;
  int SelectedIndex = -1;
  String SelectedItem = '';
  FilterBarCubit() : super(FilterBarInitial());

  void selectFilterBar(int index) {
    SelectedIndex = index;
    SelectedItem = getSelectedItemText(index);
    emit(FilterBarSelectState(SelectedIndex, SelectedItem));
  }

  String getSelectedItemText(int index) {
    switch (index) {
      case 0:
        return 'Leisure';
      case 1:
        return 'Sports';
      case 2:
        return 'Cultural';
      case 3:
        return 'Ecotourism';
      case 4:
        return 'Religious';
      default:
        return '';
    }
  }

//   FilterBarCubit() : super(FilterBarSelectState());
//   SelectFilterBar(indexxx) {
//     SelectedIndex = indexxx;
//     emit(FilterBarSelectState());
//   }

//   SelectedText(indexxx) {
//     SelectedItem = getSelectedItemText(SelectedIndex);

//     emit(FilterBarTextState());
//   }
}
