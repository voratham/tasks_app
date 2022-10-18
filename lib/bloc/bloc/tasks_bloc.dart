import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      tasks: List.from(state.tasks)..add(event.task),
    ));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isDone == false
        ? tasks.insert(index, task.copyWith(isDone: true))
        : tasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(tasks: tasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(tasks: List.from(state.tasks)..remove(event.task)));
  }
}
