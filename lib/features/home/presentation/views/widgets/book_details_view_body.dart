import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/recommended_books_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BookDetailsCustomAppBar(),
          SizedBox(height: 32),
          BookDetailsSection(),
          SizedBox(height: 70),
          RecommendedBooksSection(),
        ],
      ),
    );
  }
}
