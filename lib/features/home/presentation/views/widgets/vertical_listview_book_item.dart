import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/cached_network_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerticalListBookItem extends StatelessWidget {
  const VerticalListBookItem(this.book, {super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          GoRouter.of(
            context,
          ).push(AppRouter.kBookDetailsViewPath, extra: book);
        },
        splashColor: Colors.white.withValues(alpha: 0.1),
        highlightColor: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: CustomNetworkImage(
                  book.volumeInfo?.imageLinks?.thumbnail ??
                      'https://thumbs.dreamstime.com/b/grunge-blue-not-available-word-round-rubber-seal-stamp-white-background-162738148.jpg?w=768',
                ),
              ),
              SizedBox(width: 34),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.sectra20,
                    ),
                  ),
                  SizedBox(height: 8),
                  book.volumeInfo!.authors!.isNotEmpty
                      ? Text(book.volumeInfo!.authors!.first)
                      : Text(''),
                  SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //book.saleInfo!.price!,
                          'Free',
                          style: Styles.title18,
                        ),
                        //BookRating(book),
                        //The API doesn't have a book rating end point currently
                        Text(
                          '${book.volumeInfo!.pageCount!} pages',
                          style: Styles.title12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating(this.book, {super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Color(0xffFFD700), size: 18),
        Text(' 4.8', style: Styles.sectra16),
        SizedBox(width: 6),
        Text('(2390)', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
