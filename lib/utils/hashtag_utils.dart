import 'package:flutter/material.dart';

class HashtagUtils {
  static final RegExp hashtagRegExp = RegExp(r'(#\w+)');

  static const TextStyle hashtagStyle = TextStyle(color: Colors.blue);

  static String extractHashtags(String text) {
    final matches = hashtagRegExp.allMatches(text);
    return matches.map((m) => m.group(0)!).toSet().join(' ');
  }
}
