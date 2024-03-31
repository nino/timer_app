import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/auth.dart';
import 'package:timer_app/me_viewer.dart';
import './login_form.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tracking app',
      theme: ThemeData(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        useMaterial3: true,
        fontFamily: 'San Francisco',
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
          displayLarge: TextStyle(fontSize: 8),
          bodyLarge: TextStyle(fontSize: 14),
        ),
      ),
      home: const MyHomePage(title: 'My Toggl app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputController = TextEditingController();

  @override
  dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(),
            CredentialsViewer(),
            MeViewer(),
          ],
        ),
      ),
    );
  }
}
