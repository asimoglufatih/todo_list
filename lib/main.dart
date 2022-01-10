import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/add_todo_page_cubit.dart';
import 'package:todo_list/cubit/main_page_cubit.dart';
import 'package:todo_list/cubit/todo_detail_page_cubit.dart';
import 'package:todo_list/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainPageCubit()),
        BlocProvider(create: (context) => AddToDoPageCubit()),
        BlocProvider(create: (context) => ToDoDetailPageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
