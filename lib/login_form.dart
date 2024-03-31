import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.initialUserName, this.initialPassword});

  final String? initialUserName;
  final String? initialPassword;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

  Future<void> signIn(AuthModel auth) async {
    await auth.signIn(userNameController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (context, auth, child) {
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
            child: ElevatedButton(
                onPressed: () {
                  signIn(auth);
                },
                child: const Text('Sign in'))),
      ]));
    });
  }
}

class CredentialsViewer extends StatelessWidget {
  const CredentialsViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, auth, child) {
        return Text('Username: ${auth.username}, Password: ${auth.password}');
      },
    );
  }
}
