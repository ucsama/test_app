
import 'package:flutter/material.dart';


import '../utils/hashtag_utils.dart';

/// A widget that displays text with hashtags highlighted.
class HashtagText extends StatelessWidget {
  final String text;

  const HashtagText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: _buildTextSpans(context),
      ),
    );
  }

  /// Builds a list of [TextSpan]s with hashtags styled.
  List<TextSpan> _buildTextSpans(BuildContext context) {
    final List<TextSpan> children = [];
    final matches = HashtagUtils.hashtagRegExp.allMatches(text);

    int start = 0;
    for (final Match match in matches) {
      if (match.start > start) {
        children.add(TextSpan(text: text.substring(start, match.start)));
      }
      children.add(
        TextSpan(
          text: match.group(0),
          style: HashtagUtils.hashtagStyle,
        ),
      );
      start = match.end;
    }
    if (start < text.length) {
      children.add(TextSpan(text: text.substring(start)));
    }
    return children;
  }
}
