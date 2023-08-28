import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/features/todo/Presentation/bloc/todo_bloc.dart';

import 'features/todo/Presentation/Pages/onboarding_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (context) => di.sl<TodoBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Todo app',
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
