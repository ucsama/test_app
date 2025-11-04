
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../navigation/app_router.dart';
import '../widgets/hashtag_text.dart';

class ScreenB extends StatelessWidget {
  final String? phrase;
  final String? hashtags;

  const ScreenB({super.key, this.phrase, this.hashtags});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use the reusable HashtagText widget.
              if (phrase != null) HashtagText(text: phrase!),
              const SizedBox(height: 16),
              if (hashtags != null) HashtagText(text: hashtags!),
              const SizedBox(height: 32),
              ElevatedButton(
                // Navigate using the named route from AppRouter.
                onPressed: () => context.go(AppRouter.screenC),
                child: const Text('Go to Screen C'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate using the named route from AppRouter.
                  context.go(AppRouter.screenA);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Congratulations 🎉'),
                    ),
                  );
                },
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
