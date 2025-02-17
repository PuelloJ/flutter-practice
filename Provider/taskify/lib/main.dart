import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/core/theme/app_theme.dart';
import 'package:taskify/data/datasources/local/hive_local_datasorce.dart';
import 'package:taskify/data/repositories/category_repository_impl.dart';
import 'package:taskify/data/repositories/task_repository_impl.dart';
import 'package:taskify/domain/use_cases/categories/add_category.dart';
import 'package:taskify/domain/use_cases/categories/delete_category.dart';
import 'package:taskify/domain/use_cases/categories/get_categories.dart';
import 'package:taskify/domain/use_cases/tasks/add_task.dart';
import 'package:taskify/domain/use_cases/tasks/delete_task.dart';
import 'package:taskify/domain/use_cases/tasks/get_tasks_by_category.dart';
import 'package:taskify/domain/use_cases/tasks/update_task.dart';
import 'package:taskify/presentation/providers/category_provider.dart';
import 'package:taskify/presentation/providers/task_provider.dart';
import 'package:taskify/presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final hiveLocalDataSource = HiveLocalDatasorce();
  await hiveLocalDataSource.init();

  final categoryRepository = CategoryRepositoryImpl(hiveLocalDataSource: hiveLocalDataSource);
  final taskRepository = TaskRepositoryImpl(hiveLocalDataSource: hiveLocalDataSource);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        lazy: false,
        create: (_) => CategoryProvider(
          addCategory: AddCategory(repository: categoryRepository),
          getCategories: GetCategories(repository: categoryRepository),
          deleteCategory: DeleteCategory(repository: categoryRepository),
        )..getCategories()
      ),
      ChangeNotifierProvider(
        create: (_) => TaskProvider(
          addTask: AddTask(repository: taskRepository),
          getTasksByCategory: GetTasksByCategory(repository: taskRepository),
          updateTask: UpdateTask(repository: taskRepository),
          deleteTask: DeleteTask(repository: taskRepository),
        ),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskify',
      theme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
