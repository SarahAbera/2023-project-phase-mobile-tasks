import 'package:flutter/material.dart';
import '../Domain/task.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onTaskDetail;

  const MyCard({
    Key? key,
    required this.task,
    required this.onEdit,
    required this.onTaskDetail,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final dueDate = widget.task.date;
    return SizedBox(
      height: 75,
      width: 300,
      child: GestureDetector(
        onTap:widget.onTaskDetail,
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: checkedValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF3FAEE5),
                ),
                // const SizedBox(width: 6.0),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.task.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    DateFormat("MMMM,d,yyyy").format(dueDate),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(36, 47, 101, 1),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: widget.onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromRGBO(36, 47, 101, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
