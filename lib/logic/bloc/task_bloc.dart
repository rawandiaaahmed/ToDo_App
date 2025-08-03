import 'package:flutter_application_1/logic/bloc/task_event.dart';
import 'package:flutter_application_1/logic/bloc/task_state.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      final model = TaskModel(
        id: Uuid().v4(),
        title: event.title,
        iscompleted: false,
      );
      emit(UpdateTask(List.from(state.tasklist)..add(model)));
    });
    on<RemoveTaskEvent>((event, emit) {
      List<TaskModel> Listr = state.tasklist
          .where((tasks) => tasks.id != event.id)
          .toList();
      emit(UpdateTask(Listr));
    });
    on<ToggleTaskEvent>((event, emit) {final List<TaskModel> newList = state.tasklist.map((task) {
      return task.id == event.id
          ? task.copyWith(iscompleted: !task.iscompleted)
          : task;
    }).toList();
    emit(UpdateTask(newList));});
  }

 
}
