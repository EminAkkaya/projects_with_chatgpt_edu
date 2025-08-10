import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/models/todo_state.dart';
import 'package:mvvm_provider_todo/models/todo_status.dart';
import 'package:mvvm_provider_todo/models/todo_tile_model.dart';

class TodoViewModel extends ChangeNotifier {
  TodoState _state = TodoState(todos: []);

  List<TodoTileModel> get filteredTodos => _state.filteredTodos;

  int get lenght => _state.todos.length;

  void addTodo(String title, {String? description}) {
    if (title.isEmpty) return;
    final newTodo = TodoTileModel(title, description: description);
    _state = _state.copyWith(todos: [..._state.todos, newTodo]);
    notifyListeners();
  }

  void removeTodo(String todoId) {
    _state = _state.copyWith(
      todos: _state.todos.where((element) => element.id != todoId).toList(),
    );
    notifyListeners();
  }

  void toggleTodo(String id) {
    final updatedTodos = _state.todos.map((todo) {
      if (todo.id == id) {
        todo.toggleDone();
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: updatedTodos);
    notifyListeners();
  }

  void changeFilter(FilterType filter) {
    _state = _state.copyWith(filter: filter);
    notifyListeners();
  }
}
