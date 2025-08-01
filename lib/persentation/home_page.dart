import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit/task_cubit.dart';
import 'package:flutter_application_1/logic/cubit/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'ToDo App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final controlcubit = context.read<TaskCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  /// TextField + Button in Card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: 'Enter a task...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (controller.text.isEmpty) return;
                              controlcubit.addTask(controller.text);
                              controller.clear();
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Task List
                  Expanded(
                    child: state.tasklist.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.task_alt,
                                  size: 80, color: Colors.grey.shade400),
                              const SizedBox(height: 10),
                              const Text(
                                'No tasks yet!\nAdd your first task.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: state.tasklist.length,
                            itemBuilder: (context, index) {
                              final task = state.tasklist[index];
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  leading: Checkbox(
                                    activeColor: Colors.deepPurple,
                                    value: task.iscompleted,
                                    onChanged: (value) {
                                        controlcubit.toggleTask(
                              state.tasklist[index].id,
                            );
                                    },
                                  ),
                                  title: Text(
                                    task.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      decoration: task.iscompleted
                                          ? TextDecoration.lineThrough
                                          : null,
                                      color: task.iscompleted
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.redAccent),
                                    onPressed: () {
                                        controlcubit.removeTask(
                              state.tasklist[index].id,
                            );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}