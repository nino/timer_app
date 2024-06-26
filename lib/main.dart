import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/auth.dart';
import 'package:timer_app/dashboard.dart';
import 'package:timer_app/login_form.dart';
import 'package:window_manager/window_manager.dart';

Future<void> initWindowStuff() async {
  if (Platform.isIOS || Platform.isAndroid) {
    return;
  }
  await windowManager.ensureInitialized();
  await windowManager.setMinimumSize(const Size(300, 200));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initWindowStuff();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Platform.isIOS || Platform.isAndroid;
    return MaterialApp(
      title: 'Time tracking app',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity:
            isMobile ? null : const VisualDensity(horizontal: -4, vertical: -4),
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        useMaterial3: true,
        fontFamily: 'San Francisco',
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        )),
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
      appBar: null,
      body: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200),
          child: SafeArea(
            child: username == null ? const LoginForm() : const Dashboard(),
          )),
    );
  }
}
