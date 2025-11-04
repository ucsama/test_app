import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';
import '../widgets/custom_app_bar.dart';


class ScreenA extends StatefulWidget {
  final bool showDialog;

  const ScreenA({super.key, this.showDialog = false});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  void initState() {
    super.initState();
    if (widget.showDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCongratulationsDialog(context);
      });
    }
  }

  void _showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Congrats, you\'ve done it!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: const Text(
            'Wanna do it again?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              child: const Text('Quit', style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.go(AppRouter.screenB);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text('Do it again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'GoRouter Assignment'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Router App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.screenB),
              child: const Text('Start Assignment'),
            ),
          ],
        ),
      ),
    );
  }
}
