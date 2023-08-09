import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tasks = [
      TaskField(title: "UI/UX App Design", label: "Title"),
      TaskField(
        title:
            "First I have to animate the logo and later prototyping my design. It's very important.",
        label: "Description",
      ),
      TaskField(
        title: "April 29, 2023 12:30 AM",
        label: "Deadline",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                size: 40, color: Color.fromRGBO(36, 47, 101, 1)),
          ),
          title: const Center(
            child: Text(
              "Task detail",
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
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.only(left: 80, right: 80, top: 5),
            child:
                const Image(image: AssetImage("image_assets/task_detail.png")),
          ),
          const Column(
            children: tasks,
          ),
        ],
      ),
    );
  }
}

class TaskField extends StatelessWidget {
  const TaskField({required this.title, required this.label});
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 2),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              color: Color.fromARGB(255, 238, 238, 238),
              height: label == "Description" ? 120 : null,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}