// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
   final String title;
    final bool iscompleted;
  TaskModel({
    required this.id,
    required this.title,
    required this.iscompleted,
  });
  

  @override
  List<Object?> get props => [id,title,iscompleted];

  TaskModel copyWith({
    String? id,
    String? title,
    bool? iscompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iscompleted: iscompleted ?? this.iscompleted,
    );
  }
}
