import 'package:uuid/uuid.dart';

class TodoTileModel {
  final String id;
  String _title;
  String? description;
  bool _isDone = false;
  TodoTileModel(this._title, {this.description}) : id = Uuid().v4();

  String get getTitle => _title;
  set setTitle(newTitle) => _title = newTitle;

  bool get isDone => _isDone;

  void toggleDone() {
    _isDone = !_isDone;
  }
}
