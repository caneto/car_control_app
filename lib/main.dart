import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/isar_repository.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/dashboard/dashboard_bloc.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final repository = IsarRepository();
  // Aguarda inicialização do banco se necessário, ou trata no repository
  
  final authBloc = AuthBloc();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authBloc),
        BlocProvider(create: (_) => DashboardBloc(repository)),
      ],
      child: CarControlApp(authBloc: authBloc),
    ),
  );
}

class CarControlApp extends StatelessWidget {
  final AuthBloc authBloc;
  const CarControlApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    // Instancia o roteador passando o AuthBloc
    final appRouter = AppRouter(authBloc);

    return MaterialApp.router(
      title: 'Car Control Final',
      routerConfig: appRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}