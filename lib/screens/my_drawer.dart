import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';

import '../bloc/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TasksScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              print('state :: ${state.switchValue}');
              return Switch(
                  value: state.switchValue,
                  onChanged: ((newValue) {
                    print(newValue);
                    if (newValue) {
                      context.read<SwitchBloc>().add(SwitchOnEvent());
                    } else {
                      context.read<SwitchBloc>().add(SwitchOffEvent());
                    }
                    // newValue
                    //     ? context.read<SwitchBloc>().add(SwitchOnEvent())
                    //     : context.read<SwitchBloc>().add(SwitchOffEvent());
                  }));
            },
          )
        ],
      )),
    );
  }
}
