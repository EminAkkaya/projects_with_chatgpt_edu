import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/viewmodels/todo_view_model.dart';
import 'package:mvvm_provider_todo/views/todo_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => TodoViewModel(),
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[600]!),
      ),
      title: 'Material App',
      home: TodoView(),
    );
  }
}
