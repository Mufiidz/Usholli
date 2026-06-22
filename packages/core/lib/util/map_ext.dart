extension MapExt<K, V> on Map<K, V>? {
  Map<K, V> orEmpty() => this ?? {};
  Iterable<T> mapEntries<T>(T Function(K key, V value) mapper) =>
      orEmpty().entries.map((entry) => mapper(entry.key, entry.value));
}
