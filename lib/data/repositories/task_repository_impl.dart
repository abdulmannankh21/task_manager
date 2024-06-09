import '../../domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import '../task_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<Task>> getTasks() async {
    return dataSource.getTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    final tasks = await dataSource.getTasks();
    tasks.add(task);
    await dataSource.saveTasks(tasks);
  }

  @override
  Future<void> deleteTask(String id) async {
    final tasks = await dataSource.getTasks();
    tasks.removeWhere((task) => task.id == id);
    await dataSource.saveTasks(tasks);
  }
}
