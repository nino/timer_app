import 'package:http/http.dart' as http;
import './models/time_entry.dart';
import 'dart:convert';

Future<http.Response> getMe(String username, String password) {
  final authString = base64.encode(utf8.encode('$username:$password'));
  return http.get(Uri.parse('https://api.track.toggl.com/api/v9/me'),
      headers: {'Authorization': 'Basic $authString'});
}

Future<List<TimeEntry>> getTimeEntries(String username, String password) async {
  final authString = base64.encode(utf8.encode('$username:$password'));
  final resp = await http.get(
      Uri.parse('https://api.track.toggl.com/api/v9/me/time_entries'),
      headers: {'Authorization': 'Basic $authString'});
  List<dynamic> json = jsonDecode(resp.body);
  return json.map((raw) {
    print(raw);
    return TimeEntry.fromJson(raw);
  }).toList();
}
