import 'dart:async';

import 'package:floor/floor.dart';
import 'package:ToolBox/toolbox/data/datasource/todo_dao.dart';
import 'package:ToolBox/toolbox/domain/entities/todo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'floor_database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class FAppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
