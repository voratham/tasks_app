import 'package:flutter/material.dart';

import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  List<Task> tasks = [
    Task(title: "Task1"),
    Task(title: "Task2"),
    Task(title: "Task3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text(
                'Tasks:',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {},
                  ),
                );
              },
            ),
          )
          // ListView.builder(
          //     itemCount: tasks.length,
          //     itemBuilder: ((context, index) {
          //       var task = tasks[index];
          //       return ListTile(
          //         title: Text(task.title),
          //         trailing: Checkbox(
          //           value: task.isDone,
          //           onChanged: (value) {},
          //         ),
          //       );
          //     })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
