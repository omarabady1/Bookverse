import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'books_listview.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          BooksListView(),
          const SizedBox(height: 42),
          const Text('Best Seller', style: Styles.titleMedium),
        ],
      ),
    );
  }
}
