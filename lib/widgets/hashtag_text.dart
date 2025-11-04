import 'package:flutter/material.dart';

class HashtagText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const HashtagText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final hashtagStyle = Theme.of(context).colorScheme.secondary;
    final defaultStyle = style ?? DefaultTextStyle.of(context).style;

    final List<TextSpan> children = [];
    final RegExp hashtagRegExp = RegExp(r'(#\w+)');

    text.splitMapJoin(
      hashtagRegExp,
      onMatch: (Match match) {
        children.add(TextSpan(
          text: match.group(0),
          style: defaultStyle.copyWith(color: hashtagStyle, fontWeight: FontWeight.w600),
        ));
        return '';
      },
      onNonMatch: (String text) {
        children.add(TextSpan(text: text, style: defaultStyle));
        return '';
      },
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: children,
      ),
    );
  }
}
