// ignore_for_file: avoid_print
import 'package:new_feature/blocs/auth/auth_bloc.dart';
import 'package:new_feature/navigation/bloc_provider_config.dart';
import 'package:new_feature/navigation/scaffold_with_navbar.dart';
import 'package:new_feature/screens/screens.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _sectionANavigatorKey =
//    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

GoRouter createRouter(BuildContext context) {
  final authBloc = context.read<AuthBloc>();
  final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: <RouteBase>[
      // Post
      GoRoute(
        path: '/post/:postId',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const WhiteScreen(title: "PostScreen"),
          );
        },
      ),
      // StatefulShellBranch
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          String title;
          Widget? actionButton;
          // Switch on the state's location
          switch (state.matchedLocation) {
            case '/home':
              title = "Home";
              actionButton = null;
              break;
            case '/swipe':
              title = "Swipe";
              actionButton = null;
              break;
            case '/search':
              title = "Search";
              actionButton = null;
              break;
            case '/profile':
              title = "Ctbast";
              actionButton = null;
              break;
            case '/profile/settings':
              title = "Settings";
              actionButton = null;
              break;
            case '/profile/parameters':
              title = "Parameters";
              actionButton = null;
              break;
            default:
              title = "Default Screen";
              actionButton = null;
          }
          return ScaffoldWithNavBar(
            currentLocation: state.uri.toString(),
            navigationShell: navigationShell,
            appTitle: title,
            appBar: state.uri.toString().startsWith('/home') ||
                    state.uri.toString().startsWith('/profile') ||
                    state.uri.toString().startsWith('/swipe') ||
                    state.uri.toString().startsWith('/search') ||
                    state.uri.toString().startsWith('/notifications') ||
                    state.uri.toString().startsWith('/calendar') ||
                    state.uri.toString().startsWith('/post')
                ? null
                : AppBar(
                    // If the current location is '/** */', display a leading IconButton
                    leading: state.uri.toString() == '/***'
                        ? IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          )
                        : null,
                    // If the current location is '/swipe', don't display a title
                    title: state.uri.toString() == '/swipe' ||
                            state.uri.toString() == '/profile'
                        ? null
                        : Text(
                            title,
                            style: const TextStyle(color: Colors.black),
                          ),
                    backgroundColor: Colors.white,
                    // If an actionButton is defined, display it. Otherwise, don't display anything
                    actions: actionButton != null ? [actionButton] : null,
                    // Setting the color of the icons in the AppBar
                    iconTheme: const IconThemeData(color: Colors.black),
                    elevation: 0,
                  ),
          );
        },
        branches: <StatefulShellBranch>[
          // Home
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const WhiteScreen(title: "Home"),
                  );
                },
              ),
            ],
          ),
          // Calendar
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/calendar',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const WhiteScreen(title: "Calendar"),
                  );
                },
              ),
            ],
          ),
          // Swipe
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/swipe',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: BlocProviderConfig.getSwipeMultiBlocProvider(
                      context,
                      const SwipeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          // Search
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/search',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const WhiteScreen(title: "Search"),
                  );
                },
              ),
            ],
          ),
          // Profile
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const WhiteScreen(title: "Profile"),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  authBloc.stream.listen((state) {
    if (state.status == AuthStatus.unauthenticated) {
      goRouter.go('/swipe');
    } else if (state.status == AuthStatus.authenticated) {
      goRouter.go('/swipe');
    }
  });

  return goRouter;
}
