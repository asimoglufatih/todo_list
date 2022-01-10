import 'package:flutter/material.dart';
import 'package:todo_list/cubit/todo_detail_page_cubit.dart';
import 'package:todo_list/entitiy/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoDetailPage extends StatefulWidget {

  ToDo todo;

  ToDoDetailPage({required this.todo});

  @override
  _ToDoDetailPageState createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {

  var tfToDoDetail = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfToDoDetail.text = todo.toDo_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacak İş Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoDetail, decoration: InputDecoration(hintText: "Yapılacak iş"),),
              ElevatedButton(onPressed: (){
                context.read<ToDoDetailPageCubit>().update(widget.todo.toDo_id, tfToDoDetail.text);
              }, child: Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
