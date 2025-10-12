import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'vertical_listview_book_item.dart';
import 'custom_button.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/book_cover.png'),
        SizedBox(height: 43),
        Text('The Jungle Book', style: Styles.sectra20.copyWith(fontSize: 30)),
        SizedBox(height: 6),
        Text(
          'Rudyard Kipling',
          style: Styles.title18.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 16),
        BookRating(),
        SizedBox(height: 37),
        CustomButton(),
      ],
    );
  }
}
