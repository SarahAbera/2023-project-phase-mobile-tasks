import 'package:flutter/material.dart';
import 'screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular counter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 2, 36)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circular counter'),
    );
  }
}
