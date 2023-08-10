import 'package:flutter/material.dart';
import '../Domain/task.dart';
import 'edit_task.dart';
import '../Presentation/create_task.dart';


class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
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
      date: DateTime.now(),
    ),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Color.fromRGBO(36, 47, 101, 1),
          ),
        ),
        title: const Center(
          child: Text(
            "Todo List",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromRGBO(36, 47, 101, 1),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              size: 40,
              color: Color.fromRGBO(36, 47, 101, 1),
            ),
            onPressed: () {},
          )
        ],
      ),
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
                fontSize: 40,
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
      MaterialPageRoute(builder: (context) => CreateTaskScreen()),
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

class MyCard extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;

  const MyCard({
    Key? key,
    required this.task,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width:300,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color.fromRGBO(36, 47, 101, 1),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(36, 47, 101, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
