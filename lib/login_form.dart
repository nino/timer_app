import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/auth.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key, this.initialUserName, this.initialPassword});

  final String? initialUserName;
  final String? initialPassword;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController(text: widget.initialUserName);
    passwordController = TextEditingController(text: widget.initialPassword);
  }

  @override
  dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signIn() {
    ref
        .read(authProvider.notifier)
        .setCredentials(userNameController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);

    return Form(
        child: Column(children: <Widget>[
      Padding(
        padding: padding,
        child: TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(labelText: 'Username')),
      ),
      Padding(
        padding: padding,
        child: TextFormField(
            controller: passwordController,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              labelText: 'Password',
            )),
      ),
      Padding(
          padding: padding,
          child:
              OutlinedButton(onPressed: signIn, child: const Text('Sign in'))),
    ]));
  }
}
