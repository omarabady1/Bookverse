import 'package:flutter/material.dart';

import 'vertical_listview_book_item.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => VerticalListBookItem(),
        childCount: 10,
      ),
    );
  }
}
