import 'package:flutter/material.dart';
import 'package:todo_with_routing/Presentation/onboarding_page.dart';

// import 'package:todo_with_routing/routes/route.dart';
// import 'Presentation/home_page.dart';

// void main() => runApp(const Todo());
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
