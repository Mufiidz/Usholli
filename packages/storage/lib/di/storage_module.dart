import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_prefs/shared_prefs_keys.dart';

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<SharedPreferencesWithCache> getSharedPrefs() => SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: SharedPrefKeys.values.map((e) => e.key).toSet(),
    ),
  );
}
