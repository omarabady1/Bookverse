import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/cached_network_image.dart';

class RecommendedBooksItem extends StatelessWidget {
  const RecommendedBooksItem(this.book, {super.key});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            CustomNetworkImage(
              book.volumeInfo!.imageLinks?.thumbnail ?? kNotAvailableThumb,
            ),
            // Ink background surface + splash layer
            Positioned.fill(
              child: Material(
                color: Colors.transparent, // allows splash to be visible on top
                child: InkWell(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kBookDetailsViewPath, extra: book);
                  },
                  splashColor: Colors.white.withValues(alpha:  0.2),
                  highlightColor: Colors.white.withValues(alpha:  0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
