import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/themeTodo/darkTheme.dart';
import 'package:todo_management/themeTodo/ligthTheme.dart';
import 'package:todo_management/ui/screens/home/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const MainScreen(),
    );
  }
}