import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/search/data/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults({
    required String search,
  }) async {
    try {
      var data = await apiService.get(
        'volumes?q=$search&orderBy=newest',
      );
      List<BookModel> bookList = [];
      if (data['items'] != null && data['items'] is List) {
        for (var item in data['items']) {
          bookList.add(BookModel.fromJson(item));
        }
      }
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
