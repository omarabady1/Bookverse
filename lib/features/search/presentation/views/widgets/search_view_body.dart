import 'dart:async';
import 'package:bookly/features/search/presentation/manager/search_view_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      if (value.isNotEmpty && !value.startsWith(' ')) {
        BlocProvider.of<SearchViewCubit>(context).fetchSearchResults(value);
      } else {
        BlocProvider.of<SearchViewCubit>(context).clearSearchResults();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomSearchTextField(
            onChanged: _onSearchChanged,
            controller: searchController,
            onPressed: () {
              if (searchController.text.isNotEmpty && !searchController.text.startsWith(' ')) {
                FocusScope.of(context).unfocus();
                BlocProvider.of<SearchViewCubit>(
                  context,
                ).fetchSearchResults(searchController.text);
              } else {
                BlocProvider.of<SearchViewCubit>(context).clearSearchResults();
              }
            },
          ),
          SearchResultList(),
        ],
      ),
    );
  }
}
