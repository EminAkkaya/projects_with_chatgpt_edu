import 'package:mvvm_provider_todo/models/todo_status.dart';
import 'package:mvvm_provider_todo/models/todo_tile_model.dart';

class TodoState {
  final List<TodoTileModel> todos;
  final FilterType filter;

  TodoState({required this.todos, this.filter = FilterType.all});

  TodoState copyWith({List<TodoTileModel>? todos, FilterType? filter}) {
    return TodoState(todos: todos ?? this.todos, filter: filter ?? this.filter);
  }

  List<TodoTileModel> get filteredTodos {
    switch (filter) {
      case FilterType.done:
        return todos.where((t) => t.isDone).toList();
      case FilterType.pending:
        return todos.where((t) => !t.isDone).toList();
      default:
        return todos;
    }
  }
}
