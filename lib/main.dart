import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_management/app.dart';
import 'package:todo_management/themeTodo/darkTheme.dart';
import 'package:todo_management/themeTodo/ligthTheme.dart';
import 'package:todo_management/ui/screens/home/conversation_screen.dart';
import 'package:todo_management/ui/screens/home/main_screen.dart';

void main() {
  runApp(const MyApp());

  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MainScreen(index:2,);
        },
        routes: [
          GoRoute(
            path: 'conversation/',
            builder: (context, state) {
              return ConversationScreen();
            },
          ),
        ],
      ),
    ],
  );

}



