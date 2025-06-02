import 'package:auth_gorouter_riverpod/core/route/route_name.dart';
import 'package:auth_gorouter_riverpod/features/login/presentation/ui/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  //TODO: authState

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      // TODO: check auth state
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
        // TODO: sub routes for forgot password
        //
      ),
    ],
  );
});
