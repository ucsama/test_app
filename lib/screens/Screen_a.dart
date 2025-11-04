
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: ElevatedButton(
          // Navigate using the named route from AppRouter.
          onPressed: () => context.go(AppRouter.screenB),
          child: const Text('Go to Screen B'),
        ),
      ),
    );
  }
}
