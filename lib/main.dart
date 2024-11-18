import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/screens/home.dart';
import 'package:pomodoro/screens/splash.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
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
      transitionDuration: const Duration(milliseconds: 600),
      key: state.pageKey,
      child: const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  )
]);
