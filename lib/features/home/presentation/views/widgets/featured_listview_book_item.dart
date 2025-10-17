import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/cached_network_image.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'custom_play_button.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomNetworkImage(
          book.volumeInfo!.imageLinks?.thumbnail ?? kNotAvailableThumb,
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: CustomPlayButton()),
      ],
    );
  }
}
