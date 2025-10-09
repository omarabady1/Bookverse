import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Image.asset('assets/images/book_cover.png'),
          ),
          SizedBox(width: 34,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Harry Potter and the Goblet of Fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.sectra20,
                ),
              ),
              Text('J.K. Rowling', style: Styles.title12),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('19.99\$', style: Styles.sectra20,),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFD700),size: 18,),
                        Text(' 4.8', style: Styles.sectra16,),
                        SizedBox(width: 6),
                        Text('(2390)', style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
