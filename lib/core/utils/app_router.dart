import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/transitions.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/homeview.dart';
import 'package:bookly/features/search/data/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/manager/search_view_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/book_details_view.dart';

abstract class AppRouter {
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static const kSearchViewPath = '/searchView';
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
            BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(state.extra as BookModel),
            ),
          );
        },
      ),
      GoRoute(
        path: kSearchViewPath,
        pageBuilder: (context, state) {
          return CustomTransitions.slidLeftTransition(
            state,
            BlocProvider(
              create: (context) =>
                  SearchViewCubit(searchRepo: getIt.get<SearchRepoImpl>()),
              child: const SearchView(),
            ),
          );
        },
      ),
    ],
  );
}
