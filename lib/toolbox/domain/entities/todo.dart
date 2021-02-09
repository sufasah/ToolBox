import 'package:floor/floor.dart';

@Entity(tableName: "todo_list")
class Todo {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: "position", nullable: false)
  int position;
  @ColumnInfo(name: "title", nullable: false)
  String title;
  @ColumnInfo(name: "details", nullable: false)
  String details;
  @ColumnInfo(name: "done", nullable: false)
  bool isDone;

  Todo({this.id, this.position, this.title, this.details, this.isDone});

  @override
  String toString() {
    return "{id:${this.id},position:${this.position},title:${this.title},details:${this.details},isDone:${this.isDone}";
  }
}
