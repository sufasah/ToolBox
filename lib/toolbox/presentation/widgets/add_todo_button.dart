import 'package:flutter/material.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';
import 'package:ToolBox/toolbox/presentation/pages/todolist_item_page.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';
import 'package:provider/provider.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ToolboxLocalizations.of(context);
    return IconButton(
      icon: Icon(Icons.add),
      color: Theme.of(context).primaryColorDark,
      iconSize: 40,
      highlightColor: Colors.cyan[100],
      onPressed: () {
        final model = Provider.of<TodoModel>(context, listen: false);
        Todo entity = Todo(
            position: 0,
            title: localizations.createTodoDefaultTitle,
            details: localizations.createTodoDefaultDetails,
            isDone: false);
        model.addTodo(entity);
        Navigator.pushNamed(
          context,
          TodoListItemPage.routeName,
          arguments: entity,
        );
      },
    );
  }
}
