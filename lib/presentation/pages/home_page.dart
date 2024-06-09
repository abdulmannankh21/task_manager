import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/task_form.dart';
import '../widgets/task_list.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Column(
        children: [
          TaskForm(),
          Expanded(child: TaskList(tasks: taskList)),
        ],
      ),
    );
  }
}
