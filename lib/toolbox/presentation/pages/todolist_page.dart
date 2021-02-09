import 'package:flutter/material.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';
import 'package:ToolBox/toolbox/presentation/widgets/todo_item.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';
import 'dart:core';

class TodoListPage extends StatefulWidget {
  static const routeName = "/todolist";
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  ThemeData theme;
  final int mainAxisCount = 2;
  final double reorderablePadding = 10;
  final double reorderableSpacing = 30;
  double itemWidth;
  double itemHeight = 200;

  TodoModel model;
  List<TodoItem> todoItems;
  Future<List<Todo>> getTodos;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = Provider.of<TodoModel>(context);
    getTodos = model.getTodos;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    itemWidth = (MediaQuery.of(context).size.width -
            reorderableSpacing * (mainAxisCount - 1) -
            2 * reorderablePadding) /
        mainAxisCount;

    return FutureBuilder(
        future: getTodos,
        builder: (context, sshot) {
          if (sshot.hasData) {
            model.todos = sshot.data;
            return Consumer<TodoModel>(
              builder: (context, value, child) {
                todoItems = value.todos
                    .map((e) => TodoItem(
                        width: itemWidth, height: itemHeight, entity: e))
                    .toList();

                var _reOrder = (int oldIndex, int newIndex) {
                  final temp = todoItems.removeAt(oldIndex);
                  todoItems.insert(newIndex, temp);
                  final temp2 = value.todos.removeAt(oldIndex);
                  value.todos.insert(newIndex, temp2);
                  int start = oldIndex < newIndex ? oldIndex : newIndex;
                  int end = oldIndex > newIndex ? oldIndex + 1 : newIndex + 1;
                  bool inc = oldIndex < newIndex ? false : true;
                  temp2.position =
                      oldIndex < newIndex ? newIndex + 1 : newIndex - 1;
                  value.incOrDecIntervalPositions(start, end, inc);
                };
                return ReorderableWrap(
                  minMainAxisCount: mainAxisCount,
                  maxMainAxisCount: mainAxisCount,
                  needsLongPressDraggable: false,
                  padding: EdgeInsets.all(reorderablePadding),
                  alignment: WrapAlignment.start,
                  spacing: reorderableSpacing,
                  runSpacing: reorderableSpacing,
                  onReorder: _reOrder,
                  children: todoItems,
                );
              },
            );
          } else if (sshot.hasError) {
            return ErrorWidget(sshot.error);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
