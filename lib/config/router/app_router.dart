import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/animated_screen.dart';
import 'package:widgets_app/presentation/screens/app_tutorial_screen.dart';
import 'package:widgets_app/presentation/screens/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards_screen.dart';
import 'package:widgets_app/presentation/screens/counter_screen.dart';
import 'package:widgets_app/presentation/screens/home_screen.dart';
import 'package:widgets_app/presentation/screens/infinite_scroll.dart';
import 'package:widgets_app/presentation/screens/progress_screen.dart';
import 'package:widgets_app/presentation/screens/snackbar_screen.dart';
import 'package:widgets_app/presentation/screens/ui_controls.dart';

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
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.name,
    builder: (context, state) => SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    name: AnimatedScreen.name,
    builder: (context, state) => AnimatedScreen(),
  ),
  GoRoute(path: '/ui-controls', name: UiControls.name, builder: (context, state) => UiControls()),
  GoRoute(path: '/tutorial', name: AppTutorialScreen.name, builder: (context, state) => AppTutorialScreen()),
  GoRoute(path: '/infinity', name: InfiniteScrollScreen.name, builder: (context, state) => InfiniteScrollScreen()),
  GoRoute(path: '/counter', name: CounterScreen.name, builder: (context, state) => CounterScreen()),
]);
