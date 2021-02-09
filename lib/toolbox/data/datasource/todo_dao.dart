import 'package:floor/floor.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';

@dao
abstract class TodoDao {
  @Query("SELECT * FROM todo_list")
  Future<List<Todo>> getAllTodo();
  @Query("SELECT * FROM todo_list ORDER BY position ASC")
  Future<List<Todo>> getAllTodoOrdered();
  @Query("SELECT * FROM todo_list WHERE id=:id")
  Future<Todo> getTodo(int id);
  @insert
  Future<int> insertTodo(Todo entity);
  @update
  Future<int> updateTodo(Todo entity);
  @delete
  Future<int> deleteTodo(Todo entity);
  @transaction
  Future<void> updateTodos(List<Todo> todos) async {
    for (var i in todos) await updateTodo(i);
  }

  @Query("DELETE FROM todo_list")
  Future<void> clearTable();
}
