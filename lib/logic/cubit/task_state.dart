import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task_model.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> tasklist;

  TaskState(this.tasklist);
  @override
  List<Object?> get props => [tasklist];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class UpdateTask extends TaskState {
   UpdateTask(List<TaskModel> tasklist) : super(tasklist);
}
