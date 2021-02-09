import 'package:flutter/material.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';
import 'package:ToolBox/toolbox/presentation/pages/todolist_item_page.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final Todo entity;
  final double width;
  final double height;
  final double borderSize = 5;
  final double padding = 5;
  final int maxDetailSize = 40;
  TodoItem(
      {@required this.width, @required this.height, @required this.entity});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: borderSize,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    offset: Offset(2, 4)),
              ],
              color: Colors.yellow,
            ),
            padding: EdgeInsets.symmetric(vertical: padding),
            child: SizedBox(
              width: width - (2 * borderSize),
              height: height - (2 * borderSize + 2 * padding),
              child: Center(
                child: ListTile(
                  leading: Checkbox(
                    value: entity.isDone,
                    activeColor: Colors.deepPurple,
                    onChanged: (val) => checkAction(context, val),
                  ),
                  minLeadingWidth: 0,
                  horizontalTitleGap: 0,
                  isThreeLine: true,
                  subtitle: Text(limitDetail()),
                  title: Container(
                    child: Text(
                      entity.title,
                      softWrap: true,
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  minVerticalPadding: 10,
                  contentPadding: EdgeInsets.only(left: -10, right: 10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height,
            child: entity.isDone
                ? Placeholder(
                    color: const Color.fromRGBO(200, 0, 150, 0.8),
                    strokeWidth: 5,
                  )
                : null,
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, TodoListItemPage.routeName,
            arguments: entity);
      },
    );
  }

  void checkAction(context, bool value) {
    if (entity.isDone != value) {
      entity.isDone = value;
      final model = Provider.of<TodoModel>(context, listen: false);
      model.updateTodo(entity);
    }
  }

  String limitDetail() => entity.details.length > maxDetailSize
      ? entity.details.substring(0, maxDetailSize) + "..."
      : entity.details;
}
