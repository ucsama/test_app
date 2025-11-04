import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../navigation/app_router.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hashtag_text.dart';

class ScreenB extends StatelessWidget {
  final String? phrase;
  final String? hashtags;

  const ScreenB({super.key, this.phrase, this.hashtags});

  @override
  Widget build(BuildContext context) {
    final bool hasData = (phrase != null && phrase!.isNotEmpty) || (hashtags != null && hashtags!.isNotEmpty);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Submitted Content'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hasData)
              Card(
                color: Colors.grey[850],
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Your Phrase:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70)),
                      const SizedBox(height: 10),
                      HashtagText(text: phrase ?? "No phrase provided.", style: const TextStyle(fontSize: 16, color: Colors.white)),
                      const SizedBox(height: 24),
                      const Text('Your Hashtags:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70)),
                      const SizedBox(height: 10),
                      HashtagText(text: hashtags ?? "No hashtags provided.", style: const TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              )
            else
              const Center(
                child: Text(
                  'Go to Screen C to add content.',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.screenC),
              child: const Text('Go to Screen C'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go(AppRouter.screenA);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Congratulations 🎉', style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.green[600],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
