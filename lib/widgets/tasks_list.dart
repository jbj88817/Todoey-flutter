import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          title: tasks[index].name,
          onChanged: (checked) {
            setState(() {
              tasks[index] = tasks[index].copyWith(isDone: checked);
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
