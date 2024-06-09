import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

class TaskForm extends ConsumerStatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(
                  id: DateTime.now().toString(),
                  title: _controller.text,
                );
                ref.read(taskProvider.notifier).createTask(task); // Use ref.read instead of context.read
                _controller.clear();
              }
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
