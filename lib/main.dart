import 'package:flutter/material.dart';
import 'package:timer_app/dashboard.dart';
import 'package:timer_app/login_form.dart';
import 'package:timer_app/auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tracking app',
      theme: ThemeData(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        useMaterial3: true,
        fontFamily: 'IBM Plex Sans',
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 14),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 13),
          bodyLarge: TextStyle(fontSize: 14),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<({String? username, String? password})> creds =
        ref.watch(authProvider);
    String? username;
    switch (creds) {
      case AsyncData(:final value):
        {
          username = value.username;
        }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: Center(
        child: username == null ? const LoginForm() : const Dashboard(),
      ),
    );
  }
}
