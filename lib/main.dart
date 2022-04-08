import 'package:flutter/material.dart';
import 'package:xtintas/presentation/views/login_page.dart';

void main() {
  runApp(const XtintadApp());
}

class XtintadApp extends StatelessWidget {
  const XtintadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
