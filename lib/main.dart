import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtintas/controller/bloc/ink_bloc.dart';
import 'package:xtintas/controller/bloc/login_bloc.dart';
import 'package:xtintas/presentation/views/doubt_page.dart';
import 'package:xtintas/presentation/views/how_to_do_page.dart';
import 'package:xtintas/presentation/views/login_page.dart';
import 'package:xtintas/presentation/views/satisfaction_page.dart';

import 'presentation/views/home_page.dart';

void main() {
  runApp(const XtintadApp());
}

class XtintadApp extends StatelessWidget {
  const XtintadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: ((context) => LoginBloc())),
        BlocProvider<BlocInk>(create: ((context) => BlocInk(BlocInkState.empty)))
      ],
     
      child: MaterialApp(
        initialRoute:'/' ,
        routes: {
          '/':(context) => const LoginPage(),
          '/homePage':(context) => const HomePage(),
          '/howToDo':(context) => const HowToDoPAge(),
           '/satisfaction':(context) => const SatisfactionPage(),
           '/makeAQuestion':(context) => DoubtPage(),
        },
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
