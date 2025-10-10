import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BookDetailsCustomAppBar(),
      ],
    );
  }
}
