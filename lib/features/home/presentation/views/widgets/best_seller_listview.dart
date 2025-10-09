import 'package:flutter/material.dart';

import 'best_seller_listview_item.dart';
class BestSellerListview extends StatelessWidget {
  const BestSellerListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => BestSellerItem(),
          itemCount: 10
      ),
    );
  }
}