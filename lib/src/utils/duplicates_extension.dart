extension IterableDuplicates<T> on Iterable<T> {
  /// Returns elements that occur more than once in the iterable.
  ///
  /// Runs in O(n) time and O(n) space where `n` is the length of the iterable.
  List<T> duplicates() {
    final counts = <T, int>{};

    // Single pass to count occurrences
    for (final item in this) {
      counts[item] = (counts[item] ?? 0) + 1;
    }

    // Collect only items that appeared more than once
    return counts.entries.where((entry) => entry.value > 1).map((entry) => entry.key).toList();
  }
}
