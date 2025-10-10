import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_sliver_list.dart';
import 'books_listview.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
          child: CustomAppBar(),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BooksListView(),
                    Divider(
                      indent: MediaQuery.of(context).size.width * 0.25,
                      endIndent: MediaQuery.of(context).size.width * 0.25,
                      height: 42,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: const Text('Best Seller', style: Styles.title18),
                    ),
                  ],
                ),
              ),
              BestSellerSliverList()
            ],
          ),
        ),
      ],
    );
  }
}
