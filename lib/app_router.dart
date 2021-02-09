import 'package:flutter/material.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/presentation/pages/calculator.dart';
import 'package:ToolBox/toolbox/presentation/pages/menu_page.dart';
import 'package:ToolBox/toolbox/presentation/pages/todolist_page.dart';
import 'package:ToolBox/toolbox/presentation/pages/todolist_item_page.dart';
import 'package:ToolBox/toolbox/presentation/widgets/add_todo_button.dart';
import 'package:ToolBox/toolbox/presentation/widgets/app_scaffold.dart';

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final todoListPage = TodoListPage();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Menu());

      case TodoListPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AppScaffold(
            ToolboxLocalizations.of(context).menuTodo,
            context,
            child: todoListPage,
            actions: [
              AddTodoButton(),
            ],
            theme: Theme.of(context),
          ),
        );

      case TodoListItemPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AppScaffold(
            ToolboxLocalizations.of(context).todoItemPageTitle,
            context,
            child: TodoListItemPage(entity: settings.arguments),
            theme: Theme.of(context),
          ),
        );

      case Calculator.routeName:
        return MaterialPageRoute(
          builder: (context) => AppScaffold(
            ToolboxLocalizations.of(context).calculatorTitle,
            context,
            child: Calculator(),
            theme: Theme.of(context),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Container(
                  color: Colors.yellow[300],
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Text(
                      ToolboxLocalizations.of(context)
                          .onWrongRouteWarning(settings.name),
                      softWrap: true,
                    ),
                  ),
                ));
    }
  }
}
