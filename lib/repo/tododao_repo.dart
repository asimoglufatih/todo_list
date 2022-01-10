import 'package:todo_list/entitiy/todo.dart';
import 'package:todo_list/sqlite/database_helper.dart';

class ToDoDaoRepo{

  Future<List<ToDo>> getAllToDo() async{

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * from todo");
    
    return List.generate(maps.length, (index){
      var row = maps[index];
      return ToDo(toDo_id: row["todo_id"], toDo_name: row["todo_name"]);

    });
  }

  Future<void> deleteToDo(int todo_id) async {
    var db = await DatabaseHelper.databaseAccess();
    await db.delete("todo", where: "todo_id = ?", whereArgs: [todo_id]);
  }

  Future<void> addToDo(String toDo_name) async {
    var db = await DatabaseHelper.databaseAccess();

    var mapToDo = Map<String,dynamic>();
    mapToDo["todo_name"] = toDo_name;

    await db.insert("todo", mapToDo);
  }

  Future<void> updateToDo(int toDo_id, String toDo_name) async {
    var db = await DatabaseHelper.databaseAccess();

    var mapToDo = Map<String, dynamic>();
    mapToDo["todo_name"] = toDo_name;
    await db.update("todo", mapToDo, where: "todo_id = ?",whereArgs: [toDo_id]);
  }

  Future<List<ToDo>> searchToDo(String word) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String, dynamic>> map = await db.rawQuery("SELECT * FROM todo WHERE todo_name like '%$word%'");

    return List.generate(map.length, (index) {
      var row = map[index];
      return ToDo(toDo_id: row["todo_id"], toDo_name: row["todo_name"]);
    });
  }

}