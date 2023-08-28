import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/entities/task.dart';
import '../Widgets/custom_app_bar.dart';
import '../bloc/todo_bloc.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  late DateTime _dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(customTitle: "Create task"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'dueDate in "dd/mm/yyyy" format',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Due Date';
                  }
                  return null;
                },
                onSaved: (date) {
                  List<String> dateParts = date!.split("/");
                  int day = int.parse(dateParts[0]);
                  int month = int.parse(dateParts[1]);
                  int year = int.parse(dateParts[2]);
                  _dueDate = DateTime(year, month, day);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveTask,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3FAEE5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    "Save",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              // BlocConsumer<TodoBloc, TodoState>(
              //   listener: (context, state) {
              //     if (state is TaskFailureState) {
              //       final errorMessage = state.message;
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text(errorMessage)),
              //       );
              //     }
              //   },
              //   builder: (context, state) {
              //     return SizedBox(
              //       width: 300,
              //       height: 50,
              //       child: ElevatedButton(
              //         onPressed: _saveTask,
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: const Color(0xFF3FAEE5),
              //             foregroundColor: Colors.white,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(40),
              //             )),
              //         child: Text(
              //           state is TaskLoadedState ? "Save" : "Saving",
              //           style: const TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newTask = Tasks(
        id: DateTime.now().toString(),
        title: _title,
        description: _description,
        dueDate: _dueDate,
      );

      final todobloc = context.read<TodoBloc>();
      todobloc.add(CreateTaskEvent(newTask));
      Navigator.pop(context);
    }
  }
}
