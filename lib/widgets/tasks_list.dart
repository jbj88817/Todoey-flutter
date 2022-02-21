import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = context.watch<TaskData>().tasks;

    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          index: index,
        );
      },
      itemCount: tasks.length,
    );
  }
}

typedef TaskTileChanged = void Function(bool? b1, int index);
