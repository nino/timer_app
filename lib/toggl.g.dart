// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTimeEntriesHash() => r'f44a53a99662b5554205f318ba754506cf809a50';

/// See also [getTimeEntries].
@ProviderFor(getTimeEntries)
final getTimeEntriesProvider =
    AutoDisposeFutureProvider<List<TimeEntry>>.internal(
  getTimeEntries,
  name: r'getTimeEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTimeEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTimeEntriesRef = AutoDisposeFutureProviderRef<List<TimeEntry>>;
String _$getCurrentTimeEntryHash() =>
    r'8c130387d0e12b5f4bf64971f75f1db5f5985a42';

/// See also [getCurrentTimeEntry].
@ProviderFor(getCurrentTimeEntry)
final getCurrentTimeEntryProvider =
    AutoDisposeFutureProvider<TimeEntry?>.internal(
  getCurrentTimeEntry,
  name: r'getCurrentTimeEntryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentTimeEntryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentTimeEntryRef = AutoDisposeFutureProviderRef<TimeEntry?>;
String _$reloadAllHash() => r'5095cb6a95624771e7390972328fa2dfd7c554bc';

/// See also [reloadAll].
@ProviderFor(reloadAll)
final reloadAllProvider = AutoDisposeFutureProvider<void>.internal(
  reloadAll,
  name: r'reloadAllProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reloadAllHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReloadAllRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
