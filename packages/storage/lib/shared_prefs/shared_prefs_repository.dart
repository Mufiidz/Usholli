import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_prefs_exception.dart';
import 'shared_prefs_keys.dart';

abstract class SharedPrefsRepository {
  Future<void> saveValue<T>(SharedPrefKeys key, T value);
  Future<T?> getValue<T>(SharedPrefKeys key);
}

@Singleton(as: SharedPrefsRepository)
class SharedPrefsRepositoryImpl implements SharedPrefsRepository {
  final SharedPreferencesWithCache prefs;

  SharedPrefsRepositoryImpl(this.prefs);

  @override
  Future<T?> getValue<T>(SharedPrefKeys sharedPrefKeys) async {
    final Object? value = prefs.get(sharedPrefKeys.key);
    if (value == null) return null;
    return switch (T) {
      const (String) => value as T,
      const (int) => value as T,
      const (double) => value as T,
      const (bool) => value as T,
      const (List<String>) => value as T,
      _ => _getObject<T>(value as String),
    };
  }

  @override
  Future<void> saveValue<T>(SharedPrefKeys sharedPrefKeys, T value) => switch (value) {
    String value => prefs.setString(sharedPrefKeys.key, value),
    int value => prefs.setInt(sharedPrefKeys.key, value),
    double value => prefs.setDouble(sharedPrefKeys.key, value),
    bool value => prefs.setBool(sharedPrefKeys.key, value),
    List<String> value => prefs.setStringList(sharedPrefKeys.key, value),
    _ => _setObject(sharedPrefKeys.key, value),
  };

  Future<void> _setObject(String key, Object? value) async {
    try {
      if (value == null) return;
      return prefs.setString(key, MapperContainer.globals.toJson(value));
    } catch (e) {
      AppLogger.e(
        sender: this,
        reason: e,
        message: 'error get value of ${value.runtimeType}',
        extraInfo: key,
      );
      throw SharedPrefsException('Gagal menyimpan ${value.runtimeType}.');
    }
  }

  Future<T?> _getObject<T>(String value) async {
    try {
      if (value.isEmpty) return null;
      return MapperContainer.globals.fromJson<T>(value);
    } catch (e) {
      AppLogger.e(
        sender: this,
        reason: e,
        message: 'error get value of ${T.runtimeType}',
        extraInfo: value,
      );
      throw SharedPrefsException('Gagal mengambil ${T.runtimeType}.');
    }
  }
}
