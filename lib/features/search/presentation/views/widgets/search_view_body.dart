import 'package:bookly/features/search/presentation/manager/search_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_error_widget.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/custom_newest_books_item_shimmer.dart';
import '../../../../home/presentation/views/widgets/vertical_listview_book_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(
          controller: searchController,
          onPressed: () {
            if (searchController.text.isNotEmpty) {
              FocusScope.of(context).unfocus();
              BlocProvider.of<SearchViewCubit>(
                context,
              ).fetchSearchResults(searchController.text);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0, bottom: 8),
          child: const Text('Search Results', style: Styles.title18),
        ),
        SearchResultList(),
      ],
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewCubit, SearchViewState>(
      builder: (context, state) {
        if (state is SearchViewSuccess) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) =>
                  NewestBooksItem(state.books[index]),
              itemCount: state.books.length,
            ),
          );
        } else if (state is SearchViewFailure) {
          return Center(child: CustomErrorWidget(state.errorMessage));
        } else if (state is SearchViewLoading) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) => NewestBooksItemShimmer(),
              itemCount: 10,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
