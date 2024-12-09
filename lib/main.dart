import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pomodoro/moduls/all_tasks_modul.dart';
import 'package:pomodoro/providers/completed_tasks.dart';
import 'package:pomodoro/providers/home_screen_all.dart';
import 'package:pomodoro/providers/time_picking.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:pomodoro/screens/completed_tasks.dart';
import 'package:pomodoro/screens/home.dart';
import 'package:pomodoro/screens/instruction.dart';
import 'package:pomodoro/screens/splash.dart';
import 'package:pomodoro/screens/task_adding_sc.dart';
import 'package:pomodoro/screens/unfinished_tasks.dart';
import 'package:pomodoro/services/local_notification.dart';
import 'package:provider/provider.dart';

late Box<AllTasksModul> box;
late Box<AllTasksModul> box2;

Future<void> main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/tomato', 
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
  );

  LocalNotification.requestNotificationPermission();

  await Hive.initFlutter();

  Hive.registerAdapter(AllTasksModulAdapter());
  box = await Hive.openBox<AllTasksModul>('tasksBox');
  box2 = await Hive.openBox<AllTasksModul>('completedTasksBox');

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
        ChangeNotifierProvider(create: (context) => CompletedTasks()),
        ChangeNotifierProvider(create: (context) => HomeScreenAll()),
        ChangeNotifierProvider(create: (context) => TimePicking())
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
      transitionDuration: const Duration(milliseconds: 250),
      key: state.pageKey,
      child: const TasksScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: "/task_adding",
    pageBuilder: (context, state) => CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 100),
      key: state.pageKey,
      child: const TaskAddingSc(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
        child: child,
      ),
    ),
  ),
]);
