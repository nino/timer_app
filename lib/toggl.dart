import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timer_app/auth.dart';
import './models/time_entry.dart';
import 'dart:convert';

part 'toggl.g.dart';

Future<http.Response> getMe(String username, String password) {
  final authString = base64.encode(utf8.encode('$username:$password'));
  return http.get(Uri.parse('https://api.track.toggl.com/api/v9/me'),
      headers: {'Authorization': 'Basic $authString'});
}

@riverpod
Future<List<TimeEntry>> getTimeEntries(GetTimeEntriesRef ref) async {
  final (:username, :password) = await ref.read(authProvider.future);

  final authString = base64.encode(utf8.encode('$username:$password'));
  final resp = await http.get(
      Uri.parse('https://api.track.toggl.com/api/v9/me/time_entries'),
      headers: {'Authorization': 'Basic $authString'});
  List<dynamic> json = jsonDecode(resp.body);
  return json.map((raw) {
    return TimeEntry.fromJson(raw);
  }).toList();
}

@riverpod
Future<TimeEntry> getCurrentTimeEntry(GetCurrentTimeEntryRef ref) async {
  final (:username, :password) = await ref.read(authProvider.future);

  final authString = base64.encode(utf8.encode('$username:$password'));
  final resp = await http.get(
      Uri.parse('https://api.track.toggl.com/api/v9/me/time_entries/current'),
      headers: {'Authorization': 'Basic $authString'});
  Map<String, dynamic> json = jsonDecode(resp.body);
  return TimeEntry.fromJson(json);
}
