import 'package:flutter/material.dart';

class HashtagEditingController extends TextEditingController {
  TextStyle? hashtagStyle;

  HashtagEditingController({this.hashtagStyle});

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final finalHashtagStyle = hashtagStyle ?? TextStyle(color: Theme.of(context).colorScheme.secondary);

    final List<TextSpan> children = [];
    final RegExp hashtagRegExp = RegExp(r'(#\w+)');

    text.splitMapJoin(
      hashtagRegExp,
      onMatch: (Match match) {
        children.add(TextSpan(text: match.group(0), style: finalHashtagStyle));
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
