import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.tasks, this.onChanged})
      : super(key: key);

  final List<Task> tasks;
  final TaskTileChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          title: tasks[index].name,
          onChanged: (checked) {
            onChanged?.call(checked, index);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}

typedef TaskTileChanged = void Function(bool? b1, int index);
