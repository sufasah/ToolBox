import 'package:get_it/get_it.dart';
import 'package:ToolBox/toolbox/data/datasource/floor_database.dart';
import 'package:ToolBox/toolbox/data/datasource/todo_dao.dart';
import 'package:ToolBox/toolbox/presentation/providers/calculator_model.dart';
import 'package:ToolBox/toolbox/presentation/providers/todo_model.dart';

import 'toolbox/presentation/providers/language_model.dart';

final sl = GetIt.instance;

void init(FAppDatabase database) {
  sl.registerFactory<TodoModel>(() => TodoModel(sl()));
  sl.registerFactory<CalculatorModel>(() => CalculatorModel());
  sl.registerFactory<LanguageModel>(() => LanguageModel("en"));
  sl.registerSingleton<TodoDao>(database.todoDao);
}
