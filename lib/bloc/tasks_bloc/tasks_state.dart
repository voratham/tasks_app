part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'removedTasks': pendingTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks'])?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks'])?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
      favoriteTasks: List<Task>.from(
        (map['favoriteTasks'])?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks'])?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
    );
  }
}
