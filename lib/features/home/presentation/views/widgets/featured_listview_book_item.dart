import 'package:bookly/core/utils/cached_network_image.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'custom_play_button.dart';

class HorizontalListBookItem extends StatelessWidget {
  const HorizontalListBookItem(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomNetworkImage(
          book.volumeInfo!.imageLinks?.thumbnail ??
              'https://thumbs.dreamstime.com/b/grunge-blue-not-available-word-round-rubber-seal-stamp-white-background-162738148.jpg?w=768',
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: CustomPlayButton()),
      ],
    );
  }
}
