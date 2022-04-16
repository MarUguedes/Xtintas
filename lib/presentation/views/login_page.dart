import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas/controller/bloc/ink_bloc.dart';
import 'package:xtintas/controller/bloc/login_bloc.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _textMailController = TextEditingController();
  final TextEditingController _textPasswordController = TextEditingController();

  bool isObscured = true;
  void setVisibility() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final screenSize = MediaQuery.of(context).size;
    final blocInk = context.read<BlocInk>();

    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              CustomColors.backgroungLoginColor,
              CustomColors.backgroungLoginTransparent
            ],
          ),
        ),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            bottom: -screenSize.height*0.77,
            right: -screenSize.width*0.73,
            child: Container(
              height: 750,
              width: 750,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(600)),
                  color: Color.fromARGB(109, 125, 109, 215)),
            ),
          ),
          Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/bucket_paint.png', scale: 3),
                        Text(
                          "XTintas",
                          style: CustomFont.titleStyle,
                          semanticsLabel: '',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.115,
                    ),
                    Text(
                      'Entrar na plataforma',
                      style: CustomFont.subTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'E-mail',
                            style: CustomFont.defaultTextStyle,
                          )),
                    ),
                    TextFormField(
                      controller: _textMailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, digite seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_textMailController.text)) {
                          return 'Por favor, digite um e-mail válido';
                        }
                        return null;
                      },
                      style: CustomFont.inputTextStyle,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: CustomColors.inputBoxColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Senha',
                            style: CustomFont.defaultTextStyle,
                          )),
                    ),
                    TextFormField(
                      obscureText: isObscured,
                      controller: _textPasswordController,
                      keyboardType: TextInputType.text,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Por favor, digite uma senha';
                        }
                        return null;
                      },
                      style: CustomFont.inputTextStyle,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: CustomColors.defaultFontColor),
                          onPressed: setVisibility,
                        ),
                        filled: true,
                        fillColor: CustomColors.inputBoxColor,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 0.10,
                    ),
                    ElevatedButton(
                      onPressed: (() async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (_formkey.currentState!.validate()) {
                          bool hasLogin = await login();
                          if (hasLogin) {
                           
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/homePage', ModalRoute.withName('/'));
                          } else {
                            _textPasswordController.clear();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }

                        loginBloc.getUser(
                            email: _textMailController.text,
                            password: _textPasswordController.text);
                        //
                      }),
                      child: Image.asset('assets/login_buttom.png',semanticLabel: 'Botão de login',),
                      style: ElevatedButton.styleFrom(
                        primary: CustomColors.buttomPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: const Size(180, 35),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Text(
                      "Esqueci a minha senha",
                      style: CustomFont.inputTextStyle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  final snackBar = const SnackBar(
      content: Text(
    'E-mail ou senha inválidos',
    textAlign: TextAlign.center,
  ));

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse('https://62546fae19bc53e2347e8008.mockapi.io/login');
    var response = await http.post(url, body: {
      "email": _textMailController.text,
      "password": _textPasswordController.text,
    });
    final token = jsonDecode(response.body)['access-token'];

  
    if (response.statusCode == 201) {
     await sharedPreferences.setString('token',"Token $token");
   

      return true;
    }
    return false;
  }
}
