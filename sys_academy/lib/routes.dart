import 'package:go_router/go_router.dart';
import 'package:sys_academy/view/cadastro_page.dart';
import 'package:sys_academy/view/home_page.dart';
import 'package:sys_academy/view/login_page.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/cadastro',
      builder: (context, state) => const CadastroPage(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  ],
);
