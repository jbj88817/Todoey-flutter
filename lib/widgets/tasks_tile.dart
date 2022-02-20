import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'this is the task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        onChanged: (check) {
          setState(() {
            isChecked = check ?? false;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({Key? key, required this.isChecked, this.onChanged})
      : super(key: key);

  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: (check) {
        onChanged?.call(check);
      },
    );
  }
}
