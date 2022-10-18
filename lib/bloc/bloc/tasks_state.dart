part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> tasks;

  const TasksState({
    this.tasks = const <Task>[],
  });

  @override
  List<Object> get props => [tasks];
}
