
import 'package:flutter/material.dart';

/// A utility class for handling hashtags.
class HashtagUtils {
  /// A regular expression to find hashtags (e.g., #flutter).
  static final RegExp hashtagRegExp = RegExp(r'(#\w+)');

  /// The style to apply to hashtags.
  static const TextStyle hashtagStyle = TextStyle(color: Colors.blue);

  /// Extracts all hashtags from a given text.
  /// Returns a space-separated string of unique hashtags.
  static String extractHashtags(String text) {
    final matches = hashtagRegExp.allMatches(text);
    // Use a Set to ensure uniqueness, then join to a string.
    return matches.map((m) => m.group(0)!).toSet().join(' ');
  }
}
