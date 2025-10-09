import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_listview.dart';
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: const Text('Best Seller', style: Styles.title18),
          ),
          BestSellerListview()
        ],
      ),
    );
  }
}
