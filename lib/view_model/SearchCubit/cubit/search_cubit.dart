import 'package:bloc/bloc.dart';
import 'package:egy_travel/repositories/search_repo.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  int cubitIndex = 0;
  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  Future<void> searchPlaces(String query, String category) async {
    emit(const SearchState.loading());
    final result = await _searchRepo.searchPlaces(query.toString(), category);
    result.when(
      success: (searchResponse) => emit(SearchState.success(searchResponse)),
      failure: (error) =>
          emit(SearchState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

  void clearPlaces() {
    emit(const SearchState.initial());
    cubitIndex = 0;
  }
}
