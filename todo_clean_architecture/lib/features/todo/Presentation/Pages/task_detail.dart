import 'package:flutter/material.dart';
import '../../Domain/entities/task.dart';
import '../Widgets/custom_app_bar.dart';

class TaskDetailScreen extends StatefulWidget {
  final Tasks task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(customTitle: "Task Detail"),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
                width: 400,
                height: 50,
                child: DetailCard(
                  desc: widget.task.title,
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 400,
                child: DetailCard(
                  desc: widget.task.description,
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 400,
                height: 50,
                child: DetailCard(
                  desc: (widget.task.dueDate).toIso8601String(),
                )),
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String desc;
  const DetailCard({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFD8D9DA),
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          desc,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
