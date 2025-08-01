import 'package:flutter_application_1/logic/cubit/task_state.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  addTask(String title) {
    final model = TaskModel(id: Uuid().v4(), title: title, iscompleted: false);
    emit(UpdateTask(List.from(state.tasklist)..add(model)));
  }

  removeTask(String id) {
    List<TaskModel> Listr = state.tasklist
        .where((tasks) => tasks.id != id)
        .toList();
    emit(UpdateTask(Listr));
  }

  toggleTask(String id) {
    final List<TaskModel> newList = state.tasklist.map((task) {
      return task.id == id
          ? task.copyWith(iscompleted: !task.iscompleted)
          : task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
