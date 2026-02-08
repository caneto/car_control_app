import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../blocs/blocs/auth/auth_bloc.dart';
import '../screens/login_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/add_carro_screen.dart';

class AppRouter {
  final AuthBloc authBloc;
  AppRouter(this.authBloc);

  late final router = GoRouter(
    initialLocation: '/dashboard',
    refreshListenable: StreamListenable(authBloc.stream),
    redirect: (context, state) {
      final isLoggedIn = authBloc.state is AuthAuthenticated;
      final isLoginRoute = state.uri.toString() == '/login';

      if (!isLoggedIn && !isLoginRoute) return '/login';
      if (isLoggedIn && isLoginRoute) return '/dashboard';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'add',
            builder: (context, state) => const AddCarroScreen(),
          ),
        ],
      ),
    ],
  );
}

// Utilitário para ouvir Stream
class StreamListenable extends ChangeNotifier {
  late final StreamSubscription _subscription;
  StreamListenable(Stream stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}