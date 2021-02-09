import 'package:flutter/material.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/presentation/pages/calculator.dart';
import 'package:ToolBox/toolbox/presentation/pages/todolist_page.dart';
import 'package:ToolBox/toolbox/presentation/widgets/language_button.dart';
import 'package:ToolBox/toolbox/presentation/widgets/menu_item.dart';

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    final localizations = ToolboxLocalizations.of(context);
    return Container(
      color: Colors.yellow[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            localizations.menuTitle,
            style: TextStyle(color: Colors.greenAccent[400]),
          ),
          SizedBox(height: 50),
          MenuItem(localizations.menuTodo, TodoListPage.routeName),
          MenuItem(localizations.menuCalculator, Calculator.routeName),
          LanguageButton(),
        ],
      ),
    );
  }
}
