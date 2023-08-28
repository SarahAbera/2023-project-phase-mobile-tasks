import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/main.dart';
import '../bloc/todo_bloc.dart';
import 'create_task.dart';
import 'task_detail.dart';
import '../../Domain/entities/task.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/mycard.dart';
import 'edit_task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(GetAllTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(customTitle: "Tasks List"),
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
                  child: Image.asset("assets/image_assets/todo_man.png"),
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
              BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  if (state is TaskLoadingState || state is TodoInitial) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber[200],
                      ),
                    );
                  } else if (state is TaskLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          // final task = tasks[index];
                          return MyCard(
                            task: state.tasks[index],
                            onEdit: () => _navigateToEditTask(state.tasks[index]),
                            onTaskDetail: () => _navigateToTaskDetail(state.tasks[index]),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("wuyi error meta"),
                    );
                  }
                },
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _navigateToCreateTask() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
    );

  }

  void _navigateToEditTask(Tasks task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskScreen(task: task)),
    );

    if (result != null && result is Tasks) {
          BlocProvider.of<TodoBloc>(context).add(EditTaskEvent(result));
    }
  }

  void _navigateToTaskDetail(Tasks task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => (TaskDetailScreen(
          task: task,
        )),
      ),
    );
  }
}
