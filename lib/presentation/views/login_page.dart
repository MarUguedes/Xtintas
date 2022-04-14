import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtintas/controller/bloc/ink_bloc.dart';
import 'package:xtintas/controller/bloc/login_bloc.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textMailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

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
            bottom: -300,
            right: -100,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  color: Color.fromARGB(150, 125, 109, 215)),
            ),
          ),
          SingleChildScrollView(
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
                    controller: textMailController,
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
                  TextField(
                    obscureText: isObscured,
                    controller: textPasswordController,
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
                    onPressed: (() {
                      blocInk.getInks();

                      loginBloc.getUser(
                          email: textMailController.text,
                          password: textPasswordController.text);
                      Navigator.of(context).pushNamed('/homePage');
                    }),
                    child: Image.asset('assets/login_buttom.png'),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.buttomPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      maximumSize: const Size(200, 70),
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
        ]),
      ),
    );
  }
}
