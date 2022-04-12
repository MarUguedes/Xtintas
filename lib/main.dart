import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtintas/controller/bloc/login_bloc.dart';
import 'package:xtintas/presentation/views/how_to_do_page.dart';
import 'package:xtintas/presentation/views/login_page.dart';
import 'package:xtintas/presentation/views/satisfaction_page.dart';

void main() {
  runApp(const XtintadApp());
}

class XtintadApp extends StatelessWidget {
  const XtintadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        initialRoute:'/satisfaction' ,
        routes: {
          '/':(context) => LoginPage(),
          '/howToDo':(context) => HowToDoPAge(),
           '/satisfaction':(context) => SatisfactionPage()
        },
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
