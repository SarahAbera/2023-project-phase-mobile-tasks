import 'package:flutter/material.dart';
import '../Domain/task.dart';
import 'edit_task.dart';
import '../Presentation/create_task.dart';
import 'mycard.dart';
import 'custom_app_bar.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Task 1',
      description: 'Description for Task 1',
      date: DateTime.now(),
    ),
    Task(
      id: '2',
      title: 'Task 2',
      description: 'Description for Task 2',
      date: DateTime(2023,2,08),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const CustomAppBar(customTitle: "Tasks List"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("lib/image_assets/todo_man.png"),
              ),
            ),
            const Text(
              "Tasks list",
              style: TextStyle(
                color: Color.fromRGBO(36, 47, 101, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return MyCard(
                    task: task,
                    onEdit: () => _navigateToEditTask(task),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: _navigateToCreateTask,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF3FAEE5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Create task",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCreateTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
    );

    if (result != null && result is Task) {
      setState(() {
        tasks.add(result);
      });
    }
  }

  void _navigateToEditTask(Task task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskScreen(task: task)),
    );

    if (result != null && result is Task) {
      setState(() {
        final index = tasks.indexWhere((t) => t.id == result.id);
        if (index != -1) {
          tasks[index] = result;
        }
      });
    }
  }
}

