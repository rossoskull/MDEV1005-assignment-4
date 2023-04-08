import 'package:first_app/calculator_widget.dart';
import 'package:first_app/greeting_page_widget.dart';
import 'package:first_app/notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

/// This is the router for the app. It defines the routes and the pages that
/// will be displayed when the user navigates to a specific route.
GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: GreetingPageWidget(),
      ),
    ),
    GoRoute(
      path: '/calculator',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: CalculatorWidget(),
      ),
    ),
    GoRoute(
      path: '/notes',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: NotesWidget(),
      ),
    ),
  ],
);

/// This is the main widget for the app. It defines the theme and the router
/// for the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Assignment 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
    );
  }
}
