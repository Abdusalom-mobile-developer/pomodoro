import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/providers/completed_tasks.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:pomodoro/screens/completed_tasks.dart';
import 'package:pomodoro/screens/home.dart';
import 'package:pomodoro/screens/instruction.dart';
import 'package:pomodoro/screens/splash.dart';
import 'package:pomodoro/screens/unfinished_tasks.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToDoTasks(),
        ),
        ChangeNotifierProvider(create: (context) => CompletedTasks())
      ],
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.white,
          highlightColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(initialLocation: "/splash", routes: [
  GoRoute(
    path: "/splash",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/home",
    pageBuilder: (context, state) => CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 450),
      key: state.pageKey,
      child: const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: "/instruction",
    pageBuilder: (context, state) => CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 450),
      key: state.pageKey,
      child: const InstructionScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: "/completed_tasks",
    pageBuilder: (context, state) => CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 450),
      key: state.pageKey,
      child: const CompletedTasksScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: "/tasks",
    pageBuilder: (context, state) => CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 450),
      key: state.pageKey,
      child: const TasksScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
]);
