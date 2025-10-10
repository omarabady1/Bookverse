import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/homeview.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeviewPath = '/homeview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', //initial route
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeviewPath,
        pageBuilder: (context, state) {
          return customTransitionPage(state, const HomeView());
        },
      ),
    ],
  );

  static CustomTransitionPage<dynamic> customTransitionPage(
    GoRouterState state,
    Widget view,
  ) {
    return CustomTransitionPage(
      transitionDuration: kTransitionDuration,
      key: state.pageKey,
      child: view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }
}
