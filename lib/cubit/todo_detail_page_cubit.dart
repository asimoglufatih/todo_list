import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/repo/tododao_repo.dart';

class ToDoDetailPageCubit extends Cubit<void> {

  ToDoDetailPageCubit():super(0);

  var trepo = ToDoDaoRepo();

  Future<void> update(int toDo_id, String toDo_name) async {
    trepo.updateToDo(toDo_id, toDo_name);

  }

}