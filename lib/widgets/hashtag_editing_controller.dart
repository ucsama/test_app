
import 'package:flutter/material.dart';


import '../utils/hashtag_utils.dart';

/// A [TextEditingController] that highlights hashtags as the user types.
class HashtagEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final List<TextSpan> children = [];
    text.splitMapJoin(
      HashtagUtils.hashtagRegExp,
      onMatch: (Match match) {
        children.add(TextSpan(
          text: match.group(0),
          style: HashtagUtils.hashtagStyle,
        ));
        return '';
      },
      onNonMatch: (String text) {
        children.add(TextSpan(text: text, style: style));
        return '';
      },
    );
    return TextSpan(style: style, children: children);
  }
}
