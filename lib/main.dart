import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(const Bookverse());
}

class Bookverse extends StatelessWidget {
  const Bookverse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
    );
  }
}
