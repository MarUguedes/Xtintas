import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas/presentation/views/home_page.dart';
import 'package:xtintas/presentation/views/login_page.dart';

import '../../controller/bloc/ink_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    verifyToken().then((value) {
      if (value) {
         Navigator.of(context)
             .pushNamedAndRemoveUntil('/homePage', ModalRoute.withName('/'));
        //Navigator.of(context).pushReplacementNamed('homePage');
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', ModalRoute.withName('/authPage'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocInk = context.read<BlocInk>();
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }

  Future<bool> verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('token') == null) {
      return false;
    } else {
      return true;
    }
  }
}
