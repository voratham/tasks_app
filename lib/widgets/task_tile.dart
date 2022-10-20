import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.now())),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopupMenuButton(
                  itemBuilder: ((context) => [
                        PopupMenuItem(
                            onTap: () {},
                            child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.edit),
                                label: const Text('Edit'))),
                        PopupMenuItem(
                            onTap: () {},
                            child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.bookmark),
                                label: const Text('Add to Bookmarks'))),
                        PopupMenuItem(
                            onTap: () => _removeOrDeleteTask(context, task),
                            child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.delete),
                                label: const Text('Delete')))
                      ]))
            ],
          )
        ],
      ),
    );
  }
}
