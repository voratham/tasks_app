// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        date,
        description,
        isDeleted,
        isDone,
        isFavorite,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }
}
