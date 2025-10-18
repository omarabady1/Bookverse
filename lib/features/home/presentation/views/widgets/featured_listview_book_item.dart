import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/cached_network_image.dart';
import 'package:bookly/core/utils/custom_launch_url.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_play_button.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
          Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomNetworkImage(
              book.volumeInfo!.imageLinks?.thumbnail ?? kNotAvailableThumb,
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: CustomPlayButton(
              onPressed: () async {
                await customLaunchUrl(context, book.volumeInfo!.previewLink);
              },
            )),
          ],
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
