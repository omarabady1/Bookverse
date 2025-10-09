import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Image.asset('assets/images/app_logo.png'),
              ),
              const SizedBox(width: 10),
              const Text(
                'Bookverse',
                style: TextStyle(
                  fontFamily: AssetsData.fontFamily,
                  fontSize: 28,
                  color: Color(0xffc04a65),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Color(0xfffc931c),
          ),
        ],
      ),
    );
  }
}
