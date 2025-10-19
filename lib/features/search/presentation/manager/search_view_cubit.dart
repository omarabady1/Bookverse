import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/search/data/search_repo.dart';
import 'package:flutter/foundation.dart';
part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  SearchViewCubit({required this.searchRepo}) : super(SearchViewInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchResults(String search) async {
    emit(SearchViewLoading());
    var result = await searchRepo.fetchSearchResults(search: search);
    result.fold(
      (failure) {
        emit(SearchViewFailure(failure.errorMessage));
      },
      (books) {
        emit(SearchViewSuccess(books));
      },
    );
  }
}
