import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/entitiy/todo.dart';
import 'package:todo_list/repo/tododao_repo.dart';

class MainPageCubit extends Cubit<List<ToDo>> {

  MainPageCubit():super(<ToDo>[]);

  var trepo = ToDoDaoRepo();

  Future loadAllToDo() async {
    var list = await trepo.getAllToDo();
    emit(list);
  }

  Future delete(int todo_id) async {
    trepo.deleteToDo(todo_id);
    await loadAllToDo();
  }

  Future search(String word) async {

    var list = await trepo.searchToDo(word);
    emit(list);
  }


}