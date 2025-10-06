import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(AssetsData.logo),
        ),
        const Text(
          'Bookverse',
          style: TextStyle(
            fontFamily: AssetsData.fontFamily,
            fontSize: 32,
            color: Color(0xffc04a65),
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Read the Universe',
          style: TextStyle(fontFamily: AssetsData.fontFamily, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
