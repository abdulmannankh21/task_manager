import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

class TaskList extends ConsumerWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Add WidgetRef ref parameter
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(taskProvider.notifier).removeTask(task.id); // Use ref.read instead of context.read
            },
          ),
        );
      },
    );
  }
}
