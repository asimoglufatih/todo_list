import 'package:flutter/material.dart';
import 'package:todo_list/cubit/add_todo_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({Key? key}) : super(key: key);

  @override
  _AddToDoPageState createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {

  var tfToDo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacak İş Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDo, decoration: InputDecoration(hintText: "Yapılacak iş"),),
              ElevatedButton(onPressed: (){
                context.read<AddToDoPageCubit>().insertToDo(tfToDo.text);
              }, child: Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
