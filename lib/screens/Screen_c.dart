import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';
import '../utils/hashtag_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hashtag_editing_controller.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  late final HashtagEditingController _phraseController;
  final TextEditingController _hashtagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phraseController = HashtagEditingController();
    _phraseController.addListener(_updateHashtags);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _phraseController.hashtagStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontWeight: FontWeight.w600,
    );
  }

  @override
  void dispose() {
    _phraseController.removeListener(_updateHashtags);
    _phraseController.dispose();
    _hashtagsController.dispose();
    super.dispose();
  }

  void _updateHashtags() {
    final String text = _phraseController.text;
    final String hashtags = HashtagUtils.extractHashtags(text);
    if (_hashtagsController.text != hashtags) {
      _hashtagsController.text = hashtags;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Screen C'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _phraseController,
              decoration: const InputDecoration(
                labelText: 'Phrase',
                hintText: 'Type your phrase with #hashtags...',
                prefixIcon: Icon(Icons.short_text),
              ),
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _hashtagsController,
              decoration: const InputDecoration(
                labelText: 'Hashtags',
                hintText: 'Hashtags will appear here',
                prefixIcon: Icon(Icons.tag),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.go(
                  AppRouter.screenB,
                  extra: {
                    'phrase': _phraseController.text,
                    'hashtags': _hashtagsController.text,
                  },
                );
              },
              child: const Text('Submit Content'),
            ),
          ],
        ),
      ),
    );
  }
}
