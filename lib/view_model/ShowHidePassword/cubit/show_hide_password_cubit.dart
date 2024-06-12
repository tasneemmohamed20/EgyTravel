import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_hide_password_state.dart';

class ShowHideCubit extends Cubit<ShowHideState> {
  ShowHideCubit() : super(VisiblilityOnOff());
  bool secure = true;

  showHideSwitch() {
    secure = !secure;
    emit(VisiblilityOnOff());
  }
}
