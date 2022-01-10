import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/main_page_cubit.dart';
import 'package:todo_list/entitiy/todo.dart';
import 'package:todo_list/views/add_todo_page.dart';
import 'package:todo_list/views/todo_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().loadAllToDo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: isSearching ?
        TextField(
          decoration: InputDecoration(hintText: "Search"),
          onChanged: (word){
            context.read<MainPageCubit>().search(word);
          },
        ) :
        Text("Yapılacaklar"),
        actions: [isSearching ?
          IconButton(onPressed: (){
            context.read<MainPageCubit>().loadAllToDo();
            setState(() {isSearching = false;});
          }, icon: Icon(Icons.cancel),) :
          IconButton(onPressed: (){
            setState(() {isSearching = true;});
          }, icon: Icon(Icons.search) ,)
        ],
      ),
      body: BlocBuilder<MainPageCubit,List<ToDo>>(
        builder: (context, toDoList){
          if(toDoList.isNotEmpty){
            return ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index){
                var toDo = toDoList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetailPage(todo: toDo))).then((_){
                      context.read<MainPageCubit>().loadAllToDo();
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text("${toDo.toDo_id} - ${toDo.toDo_name}"),
                          Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Delete?"),
                                  action: SnackBarAction(
                                    label: "Yes",
                                    onPressed: (){
                                      context.read<MainPageCubit>().delete(toDo.toDo_id);
                                    },
                                  ),
                                ),
                            );
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          }else{
            return Center();
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddToDoPage())).then((_) {
            context.read<MainPageCubit>().loadAllToDo();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
