import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/repo/tododao_repo.dart';

class AddToDoPageCubit extends Cubit {

  AddToDoPageCubit():super(0);

  var trepo = ToDoDaoRepo();

  Future<void> insertToDo(String toDo_name) async {
    await trepo.addToDo(toDo_name);

  }

}