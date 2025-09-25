import 'package:go_router/go_router.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/screens/avatar_screen.dart';
import 'package:test_task/screens/info_screen.dart';
import 'package:test_task/screens/leaderboard_screen.dart';
import 'package:test_task/screens/level_select_screen.dart';
import 'package:test_task/screens/loading_screen.dart';
import 'package:test_task/screens/main_screen.dart';
import 'package:test_task/screens/menu_screen.dart';
import 'package:test_task/screens/privacy_Screen.dart';
import 'package:test_task/screens/profile_screen.dart';
import 'package:test_task/screens/settings_screen.dart';
import 'package:test_task/screens/shop_screen.dart';
import 'package:test_task/screens/terms_screen.dart';

class AppRouter {
  static late final GoRouter _router;

  static void init() {
    _router = _createRouter();
  }

  static GoRouter get router => _router;

  static GoRouter _createRouter() {
    return GoRouter(
      initialLocation: AppRouteNames.loading,
      routes: [
        GoRoute(
          path: AppRouteNames.loading,
          name: AppRouteNames.loading,
          builder: (context, state) => const LoadingScreen(),
        ),
        GoRoute(
          path: AppRouteNames.main,
          name: AppRouteNames.main,
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: AppRouteNames.selectLevel,
              name: AppRouteNames.selectLevel,
              builder: (context, state) => const LevelSelectScreen(),
            ),
            GoRoute(
              path: AppRouteNames.info,
              name: AppRouteNames.info,
              builder: (context, state) => const InfoScreen(),
            ),
            GoRoute(
              path: AppRouteNames.shop,
              name: AppRouteNames.shop,
              builder: (context, state) => const ShopScreen(),
            ),
            GoRoute(
              path: AppRouteNames.menu,
              name: AppRouteNames.menu,
              builder: (context, state) => const MenuScreen(),
              routes: [
                GoRoute(
                  path: AppRouteNames.profile,
                  name: AppRouteNames.profile,
                  builder: (context, state) => const ProfileScreen(),
                  routes: [
                    GoRoute(
                      path: AppRouteNames.avatar,
                      name: AppRouteNames.avatar,
                      builder: (context, state) => const AvatarScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: AppRouteNames.settings,
                  name: AppRouteNames.settings,
                  builder: (context, state) => const SettingsScreen(),
                ),
                GoRoute(
                  path: AppRouteNames.leaderboard,
                  name: AppRouteNames.leaderboard,
                  builder: (context, state) => const LeaderboardScreen(),
                ),
                GoRoute(
                  path: AppRouteNames.privacy,
                  name: AppRouteNames.privacy,
                  builder: (context, state) => const PrivacyScreen(),
                ),
                GoRoute(
                  path: AppRouteNames.terms,
                  name: AppRouteNames.terms,
                  builder: (context, state) => const TermsScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
      // errorBuilder: (context, state) => const NotFoundPage(),
    );
  }
}
