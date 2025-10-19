import 'package:bookly/features/home/presentation/views/widgets/custom_newest_books_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/custom_error_widget.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/vertical_listview_book_item.dart';
import '../../manager/search_view_cubit.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewCubit, SearchViewState>(
      builder: (context, state) {
        if (state is SearchViewSuccess) {
          if (state.books.isNotEmpty) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, bottom: 8),
                    child: const Text('Search Results', style: Styles.title18),
                  ),
                  Expanded(
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) =>
                          NewestBooksItem(state.books[index]),
                      itemCount: state.books.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Expanded(
              child: Center(
                child: Text(
                  'Couldn\'t find books with this title',
                  style: Styles.title18.copyWith(color: Colors.grey),
                ),
              ),
            );
          }
        } else if (state is SearchViewFailure) {
          return Center(child: CustomErrorWidget(state.errorMessage));
        } else if (state is SearchViewLoading) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, bottom: 8),
                  child: const Text('Search Results', style: Styles.title18),
                ),
                Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) => NewestBooksItemShimmer(),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: Text(
                'Start typing to search',
                style: Styles.title18.copyWith(color: Colors.grey),
              ),
            ),
          );
        }
      },
    );
  }
}
