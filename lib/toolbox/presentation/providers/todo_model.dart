import 'dart:async';

import 'package:flutter/Material.dart';
import 'package:ToolBox/toolbox/data/datasource/todo_dao.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';

class TodoModel extends ChangeNotifier {
  TodoDao _todoDao;
  TodoModel(this._todoDao) : assert(_todoDao != null) {
    _getTodos = _todoDao.getAllTodoOrdered();
  }

  Future<List<Todo>> _getTodos;
  Future<List<Todo>> get getTodos => _getTodos;
  List<Todo> _todos;
  List<Todo> get todos => _todos;
  set todos(val) => _todos = val;
  /*List<Widget> _todoItems;
  List<Widget> get todoItems => _todoItems;*/

  void incOrDecIntervalPositions(int start, int end, bool increment) {
    for (int i = start; i < end; i++) todos[i].position += increment ? 1 : -1;
    _todoDao.updateTodos(todos.sublist(start, end));
  }

  Future<void> addTodo(Todo entity) async {
    entity.id = await _todoDao.insertTodo(entity);
    todos.insert(0, entity);
    incOrDecIntervalPositions(1, todos.length, true);
    notifyListeners();
  }

  Future<void> deleteTodo(Todo entity) async {
    int index = todos.indexOf(entity);
    if (index != -1) {
      _todoDao.deleteTodo(entity);
      todos.removeAt(index);
      incOrDecIntervalPositions(index, todos.length, false);
    }
    notifyListeners();
  }

  Future<void> updateTodo(Todo entity) async {
    final whr = todos.where((element) => element.id == entity.id);
    if (whr.isNotEmpty) {
      final elem = whr.first;
      elem.details = entity.details;
      elem.isDone = entity.isDone;
      elem.position = entity.position;
      elem.title = entity.title;

      _todoDao.updateTodo(entity);
    }
    notifyListeners();
  }
}
