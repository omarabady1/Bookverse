import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'featured_books__state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
