import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:bookly/features/splash/presentation/view/splash.dart';
import 'package:go_router/go_router.dart';

class BooklyRouter {
  BooklyRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      )
    ],
  );
}
