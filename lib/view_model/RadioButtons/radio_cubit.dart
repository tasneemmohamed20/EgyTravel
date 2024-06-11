import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioButtonCubit extends Cubit<RadioButtonState> {
  RadioButtonCubit() : super(RadioButtonSelected());
  int selected = -1;

  selectedRadio(indexx) {
    selected = indexx;
    emit(RadioButtonSelected());
  }
}
