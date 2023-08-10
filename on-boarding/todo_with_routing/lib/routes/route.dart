import 'package:flutter/material.dart';

import '../Presentation/create_task.dart';
import '../Presentation/edit_task.dart';
import '../Presentation/home_page.dart';
import '../Presentation/onboarding_page.dart';
import '../Domain/task.dart';

const String createTaskpage = "createTask";
const String editTaskPage = "editTask";
const String homePage = "home";
const String onboardingPage = "onboarding";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case createTaskpage:
      return MaterialPageRoute(builder: (context) => const CreateTaskScreen());

    case editTaskPage:
      final Task task = settings.arguments as Task;
      return MaterialPageRoute(builder: (context) => EditTaskScreen(task: task));

    case homePage:
      return MaterialPageRoute(builder: (context) => TaskListScreen());

    case onboardingPage:
      return MaterialPageRoute(builder: (context) => const OnboardingPage());

    default:
      return throw ("Invalid Navigation");
  }
}
