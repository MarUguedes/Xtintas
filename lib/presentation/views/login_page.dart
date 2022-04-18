import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtintas/controller/bloc/login_bloc.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

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
    print(screenSize.width);

    final mailvalidator = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return Scaffold(
      backgroundColor: CustomColors.backgroungLoginColor,
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
            bottom: -619,
            right: -280,
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
                        Image.asset(
                          'assets/bucket_paint.png',
                          scale: 3,
                          semanticLabel: 'Ícone do aplicativo',
                        ),
                        Text(
                          Strings.appName,
                          style: CustomFontStyle.titleStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.115,
                    ),
                    Text(
                      Strings.loginPageTitle,
                      style: CustomFontStyle.subTitleStyle,
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
                            Strings.mail,
                            style: CustomFontStyle.defaultTextStyle,
                          )),
                    ),
                    TextFormField(
                      controller: _textMailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return Strings.emptyMail;
                        } else if (!mailvalidator.hasMatch(email)) {
                          return Strings.invalidMail;
                        }
                        return null;
                      },
                      style: CustomFontStyle.inputTextStyle,
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
                            Strings.password,
                            style: CustomFontStyle.defaultTextStyle,
                          )),
                    ),
                    TextFormField(
                      obscureText: isObscured,
                      controller: _textPasswordController,
                      keyboardType: TextInputType.text,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return Strings.emptyPassword;
                        }
                        return null;
                      },
                      style: CustomFontStyle.inputTextStyle,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomColors.defaultFontColor,
                            semanticLabel: 'Mudar visibilidade da senha',
                          ),
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
                        FocusScope.of(context).unfocus();

                        if (_formkey.currentState!.validate()) {
                          bool hasLogin = await loginBloc.login(
                              email: _textMailController.text,
                              password: _textPasswordController.text);

                          if (hasLogin) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/homePage', (Route<dynamic> route) => false);
                          } else {
                            _textPasswordController.clear();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }

                        //
                      }),
                      child: Image.asset(
                        'assets/login_buttom.png',
                        semanticLabel: 'Botão de login',
                      ),
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
                      Strings.forgotPassword,
                      style: CustomFontStyle.inputTextStyle2,
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
      backgroundColor: Colors.red,
      content: Text(
        Strings.invalidLogin,
        textAlign: TextAlign.center,
      ));
}
