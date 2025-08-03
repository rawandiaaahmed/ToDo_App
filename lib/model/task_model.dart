// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

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

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'iscompleted': iscompleted,
    };
  }

  factory TaskModel.fromjson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      iscompleted: map['iscompleted'] as bool,
    );
  }

  String toJson() => json.encode(tojson());

  factory TaskModel.fromJson(String source) => TaskModel.fromjson(json.decode(source) as Map<String, dynamic>);
}
