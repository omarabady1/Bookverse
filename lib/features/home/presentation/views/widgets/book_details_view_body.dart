import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/recommended_books_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'best_seller_list_item.dart';
import 'custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BookDetailsCustomAppBar(),
          SizedBox(height: 32),
          Image.asset('assets/images/book_cover.png'),
          SizedBox(height: 43),
          Text(
            'The Jungle Book',
            style: Styles.sectra20.copyWith(fontSize: 30),
          ),
          SizedBox(height: 6),
          Text(
            'Rudyard Kipling',
            style: Styles.title18.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 16),
          BookRating(),
          SizedBox(height: 37),
          CustomButton(),
          SizedBox(height: 70),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'You can also like',
                style: Styles.title18.copyWith(fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 16),
          RecommendedBooksList(),
        ],
      ),
    );
  }
}
