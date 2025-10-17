import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_horizontal_books_itme_shimmer.dart';
import 'package:bookly/features/home/presentation/views/widgets/recommended_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedBooksList extends StatelessWidget {
  const RecommendedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecommendedBooksItem(state.books[index]);
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 75 / 112,
                  child: HorizontalListBookItemShimmer(),
                );
              },
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
