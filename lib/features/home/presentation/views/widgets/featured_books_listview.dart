import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books__cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_horizontal_books_itme_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_error_widget.dart';
import 'featured_listview_book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalListBookItem(state.books[index]);
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorWidget(state.errorMessage),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalListBookItemShimmer();
              },
              itemCount: 5,
            ),
          );
        }
      },
    );
  }
}
