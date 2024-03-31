import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:timer_app/auth.dart';
import 'package:flutter/material.dart';
import './toggl.dart' as toggl;

class MeViewer extends StatelessWidget {
  const MeViewer({super.key});

  Future<void> getMe(AuthModel auth) async {
    final resp = await toggl.getTimeEntries(auth.username ?? '', auth.password ?? '');
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (context, auth, child) {
      return ElevatedButton(
          onPressed: () {
            getMe(auth);
          },
          child: const Text('get me'));
    });
  }
}
