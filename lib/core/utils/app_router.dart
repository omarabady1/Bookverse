import 'package:bookly/core/utils/transitions.dart';
import 'package:bookly/features/home/presentation/views/homeview.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', //initial route
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewPath,
        pageBuilder: (context, state) {
          return CustomTransitions.fadeWithSlideUpTransition(
            state,
            const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kBookDetailsViewPath,
        pageBuilder: (context, state) {
          return CustomTransitions.slidLeftTransition(
            state,
            const BookDetailsViewBody(),
          );
        },
      ),
    ],
  );
}
