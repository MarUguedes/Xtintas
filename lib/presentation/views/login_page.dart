import 'package:flutter/material.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController textMailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                    const Icon(
                      Icons.color_lens,
                      size: 50,
                      color: CustomColors.defaultFontColor,
                    ),
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
                TextField(
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
                  controller: textPasswordController,
                  style: CustomFont.inputTextStyle,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: CustomColors.inputBoxColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: screenSize.width * 0.10,
                ),
                ElevatedButton(
                  onPressed: (() {
                    print(
                        '${textMailController.text}${textPasswordController.text}');
                  }),
                  child: Image.asset('assets/login_buttom.png'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        CustomColors.buttomPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
