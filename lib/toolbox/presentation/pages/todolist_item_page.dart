import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';
import 'package:provider/provider.dart';

class TodoListItemPage extends StatelessWidget {
  static const String routeName = '/todolist/change-item';
  final Todo entity;
  TodoListItemPage({@required this.entity, Key key}) : super(key: key);
  final titleTextStyles =
      GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.bold);
  final inputTextStyles =
      GoogleFonts.lemonada(fontSize: 14, color: Colors.white);
  final inputDecorations = InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 3),
      ),
      fillColor: Colors.purple[300],
      filled: true,
      focusColor: Colors.red);
  final inputValues = <String>[null, null];
  @override
  Widget build(BuildContext context) {
    final localizations = ToolboxLocalizations.of(context);
    return Container(
      color: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Row(
            children: [
              Text(
                localizations.todoItemPageTitleLabel,
                style: titleTextStyles,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: TextField(
                  style: inputTextStyles,
                  decoration: inputDecorations,
                  controller: TextEditingController(text: entity.title),
                  onChanged: (value) => inputValues[0] = value,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            localizations.todoItemPageDetailsLabel,
            style: titleTextStyles,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            minLines: 5,
            maxLines: 17,
            style: inputTextStyles,
            decoration: inputDecorations,
            controller: TextEditingController(text: entity.details),
            onChanged: (value) => inputValues[1] = value,
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<TodoModel>(
            builder: (context, value, child) => Row(
              children: [
                Expanded(
                  child: RaisedButton(
                      onPressed: () => onSave(context, value),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        localizations.todoItemPageSaveButton,
                        style: titleTextStyles,
                      ),
                      color: Colors.greenAccent),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () => onDelete(context, value),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.redAccent,
                    child: Text(
                      localizations.todoItemPageDeleteButton,
                      style: titleTextStyles,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () => onCancel(context, value),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey[400],
                    child: Text(
                      localizations.todoItemPageCancelButton,
                      style: titleTextStyles,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onSave(context, TodoModel value) {
    Navigator.pop(context);
    if (inputValues[0] != null || inputValues[1] != null) {
      entity.details = inputValues[1] ?? entity.details;
      entity.title = inputValues[0] ?? entity.title;
      value.updateTodo(entity);
    }
  }

  void onDelete(context, TodoModel value) {
    final localizations = ToolboxLocalizations.of(context);
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        localizations.alertDialogDeleteTitle,
        style: titleTextStyles,
      ),
      content: Text(localizations.alertDialogDeleteMessage),
      actions: [
        FlatButton(
          child: Text(localizations.alertDialogYes),
          onPressed: () {
            value.deleteTodo(entity);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.red,
        ),
        FlatButton(
          child: Text(localizations.alertDialogNo),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black12,
        )
      ],
      backgroundColor: Colors.grey[200],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  void onCancel(context, value) {
    Navigator.pop(context);
  }
}
