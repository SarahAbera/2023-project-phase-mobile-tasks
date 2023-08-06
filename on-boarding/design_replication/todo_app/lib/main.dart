import 'package:flutter/material.dart';
import 'onboarding_page.dart';

void main() => runApp(const Todo());

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo app',
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

