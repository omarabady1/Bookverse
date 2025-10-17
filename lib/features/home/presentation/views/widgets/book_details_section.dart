import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/cached_network_image.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_button.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: CustomNetworkImage(
              book.volumeInfo!.imageLinks?.thumbnail ?? kNotAvailableThumb,
            ),
          ),
          SizedBox(height: 40),
          Text(
            book.volumeInfo!.title!,
            style: Styles.sectra20.copyWith(fontSize: 30),
          ),
          SizedBox(height: 6),
          Text(
            book.volumeInfo!.authors!.isNotEmpty
                ? book.volumeInfo!.authors!.first
                : '',
            style: Styles.title18.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 16),
          //BookRating(BookModel()),
          SizedBox(height: 37),
          CustomButton(book),
        ],
      ),
    );
  }
}
