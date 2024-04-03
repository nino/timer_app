import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/auth.dart';
import 'package:timer_app/models/time_entry.dart';
import 'package:timer_app/toggl.dart';
import 'package:timer_app/models/project.dart';

String? projectName(AsyncValue<List<Project>> projects, int? projectId) {
  if (projectId == null) {
    return null;
  }
  if (projects.hasValue) {
    final projs = projects.value!;
    String? name;
    for (final proj in projs) {
      if (proj.id == projectId) {
        name = proj.name;
      }
    }
    return name;
  }
  return null;
}

class TimeEntryListItem extends ConsumerWidget {
  const TimeEntryListItem({super.key, required this.timeEntry});
  final TimeEntry timeEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(getProjectsProvider);
    return SizedBox(
        height: 50,
        width: 100,
        child: Column(children: [
          Text(projectName(projects, timeEntry.projectId) ?? '(no project)'),
          Text(timeEntry.description)
        ]));
  }
}

class CurrentTimeEntry extends ConsumerWidget {
  const CurrentTimeEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEntry = ref.watch(getCurrentTimeEntryProvider);
    return switch (currentEntry) {
      AsyncData(value: null) => const Text("No current entry"),
      AsyncData(:final value) when value != null =>
        Text('Current entry: ${value.description}'),
      AsyncLoading() => const Text("Loading current entry…"),
      _ => const Text("Failed to load current entry"),
    };
  }
}

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeEntries = ref.watch(getTimeEntriesProvider);
    final currentEntry = ref.watch(getCurrentTimeEntryProvider);

    return Column(
      children: [
        const CurrentTimeEntry(),
        switch (timeEntries) {
          AsyncData(:final value) => Expanded(
                child: ListView.builder(
              itemCount: value.length,
              itemExtent: 50,
              itemBuilder: (BuildContext context, int index) =>
                  TimeEntryListItem(timeEntry: value[index]),
            )),
          AsyncLoading() => const Expanded(child: Text('Loading…')),
          _ => const Text('error'),
        },
        Row(children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                  onPressed: () => ref.read(reloadAllProvider.future),
                  child: const Text('Reload'))),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text((timeEntries.isLoading || currentEntry.isLoading)
                  ? '⌛'
                  : '👍')),
          Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                  onPressed: () =>
                      ref.read(authProvider.notifier).setCredentials('', ''),
                  child: const Text('Sign out')))
        ])
      ],
    );
  }
}
