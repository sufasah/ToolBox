import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ToolBox/localization.dart';
import 'package:ToolBox/toolbox/data/datasource/floor_database.dart';
import 'package:ToolBox/toolbox/presentation/providers/calculator_model.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import 'injection_container.dart' as di;
import 'toolbox/presentation/providers/language_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorFAppDatabase.databaseBuilder("floortoolbox.db").build();
  //database.todoDao.clearTable();

  di.init(database);
  runApp(
    Material(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<TodoModel>(create: (context) => di.sl()),
          ChangeNotifierProvider<LanguageModel>(create: (context) => di.sl()),
          ChangeNotifierProvider<CalculatorModel>(create: (context) => di.sl()),
        ],
        builder: (context, child) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageModel>(
      builder: (context, value, child) => MaterialApp(
        locale: Locale(value.locale, ''),
        onGenerateTitle: (BuildContext context) =>
            ToolboxLocalizations.of(context).menuTitle,
        localizationsDelegates: [
          const ToolboxLocalizationsDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('tr', ''),
        ],
        onGenerateRoute: AppRouter.generateRoute,
        title: 'Toolbox',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          primaryColorDark: Colors.deepPurple,
        ),
      ),
    );
  }
}
