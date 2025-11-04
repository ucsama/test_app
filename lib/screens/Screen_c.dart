
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';
import '../utils/hashtag_utils.dart';
import '../widgets/hashtag_editing_controller.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  // Use the custom controller for the phrase field.
  late final HashtagEditingController _phraseController;
  final TextEditingController _hashtagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phraseController = HashtagEditingController()
      ..addListener(_updateHashtags);
  }

  @override
  void dispose() {
    _phraseController.removeListener(_updateHashtags);
    _phraseController.dispose();
    _hashtagsController.dispose();
    super.dispose();
  }

  /// Updates the hashtags field based on the content of the phrase field.
  void _updateHashtags() {
    final String text = _phraseController.text;
    // Use the utility to extract hashtags.
    final String hashtags = HashtagUtils.extractHashtags(text);
    _hashtagsController.value = _hashtagsController.value.copyWith(
      text: hashtags,
      selection: TextSelection.collapsed(offset: hashtags.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phraseController,
              decoration: const InputDecoration(
                labelText: 'Phrase',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hashtagsController,
              decoration: const InputDecoration(
                labelText: 'Hashtags',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate using the named route and pass data as extra.
                context.go(
                  AppRouter.screenB,
                  extra: {
                    'phrase': _phraseController.text,
                    'hashtags': _hashtagsController.text,
                  },
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
