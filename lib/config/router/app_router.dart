import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen()),
  GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => CardsScreen()),
  GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => ButtonsScreen()),
]);
