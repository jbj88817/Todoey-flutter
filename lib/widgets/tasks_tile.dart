import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = context.watch<TaskData>().tasks;
    bool isChecked = tasks[index].isDone;

    return ListTile(
        onLongPress: () {
          context.read<TaskData>().deleteTask(tasks[index]);
        },
        title: Text(
          tasks[index].name,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (checked) {
            context.read<TaskData>().toggleTask(index, checked ?? false);
          },
        ));
  }
}
