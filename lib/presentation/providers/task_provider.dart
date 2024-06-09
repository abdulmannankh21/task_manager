import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../data/task_data_source.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';

// Providers for data source and repository
final taskDataSourceProvider = Provider((ref) => TaskDataSource());
final taskRepositoryProvider = Provider((ref) => TaskRepositoryImpl(ref.read(taskDataSourceProvider)));

// Providers for use cases
final getTasksProvider = Provider((ref) => GetTasks(ref.read(taskRepositoryProvider)));
final addTaskProvider = Provider((ref) => AddTask(ref.read(taskRepositoryProvider)));
final deleteTaskProvider = Provider((ref) => DeleteTask(ref.read(taskRepositoryProvider)));

// StateNotifierProvider for TaskNotifier
final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier(
    ref.read(getTasksProvider),
    ref.read(addTaskProvider),
    ref.read(deleteTaskProvider),
  );
});

class TaskNotifier extends StateNotifier<List<Task>> {
  final GetTasks getTasks;
  final AddTask addTask;
  final DeleteTask deleteTask;

  TaskNotifier(this.getTasks, this.addTask, this.deleteTask) : super([]);

  void loadTasks() async {
    final tasks = await getTasks();
    state = tasks;
  }

  void createTask(Task task) async {
    await addTask(task);
    loadTasks();
  }

  void removeTask(String id) async {
    await deleteTask(id);
    loadTasks();
  }
}
