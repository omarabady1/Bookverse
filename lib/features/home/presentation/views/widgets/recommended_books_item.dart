import 'package:bookly/constants.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/cached_network_image.dart';

class RecommendedBooksItem extends StatelessWidget {
  const RecommendedBooksItem(this.book, {super.key});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      book.volumeInfo!.imageLinks?.thumbnail ?? kNotAvailableThumb,
    );
  }
}
