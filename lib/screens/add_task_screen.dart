import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen(
      {Key? key, required this.tasks, required this.callbackList})
      : super(key: key);

  final List<Task> tasks;
  final ValueChanged<List<Task>> callbackList;

  @override
  Widget build(BuildContext context) {
    String inputText = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                inputText = value;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: () {
                if (inputText.isNotEmpty) {
                  tasks.add(
                    Task(name: inputText),
                  );
                }
                callbackList.call(tasks);
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
