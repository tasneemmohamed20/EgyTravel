import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_all_state.dart';

class ViewAllCubit extends Cubit<ViewAllState> {
  ViewAllCubit() : super(ViewAllInitial());
}
