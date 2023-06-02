import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_site/src/my_site/view/view.dart';

class AppRouter {
  // all the route paths. So that we can access them easily  across the app
  static const root = '/';
  static const portfolio = '/portfolio';
  static const contact = '/contact';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: PersistedPage(
              location: state.location,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomePage(),
              );
            },
          ),
          GoRoute(
            path: portfolio,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: PortfolioPage(),
              );
            },
          ),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: contact,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ContactPage(),
                );
              }),
        ],
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/login',
      //   pageBuilder: (context, state) {
      //     return NoTransitionPage(
      //       key: UniqueKey(),
      //       child: Scaffold(
      //         appBar: AppBar(),
      //         body: const Center(
      //           child: Text("Login"),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    ],
  );
}
