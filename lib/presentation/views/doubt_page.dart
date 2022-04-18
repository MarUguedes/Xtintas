import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtintas/controller/bloc/doubt_bloc.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

class DoubtPage extends StatelessWidget {
  DoubtPage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  SnackBar showSnackBar(String mensage) {
    return SnackBar(
      content: Text(
        mensage,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final blocDoubt = (context).read<DoubtBloc>();
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  tooltip: 'voltar para a tela inicial',
                  onPressed: (() {
                    Navigator.of(context).pushReplacementNamed('/homePage');
                  }),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: screenSize.height < 700
                                ? screenSize.height * 0.40
                                : screenSize.height * 0.35,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  color: CustomColors.backgroungColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, right: 10, left: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          Strings.makeAQuestion,
                                          style: CustomFontStyle.subtitleStyle3,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SizedBox(
                                          height: screenSize.height >= 800
                                              ? 110
                                              : 100,
                                          child: TextFormField(
                                            maxLines: 6,
                                            controller: controller,
                                            decoration: const InputDecoration(
                                                hintText: Strings.helperText,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: CustomColors
                                                            .borderColor)),
                                                fillColor:
                                                    CustomColors.inputBoxColor,
                                                filled: true),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                          onPressed: (() async {
                                            final question = controller.text;
                                            if (question.isNotEmpty) {
                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);
                                              blocDoubt
                                                  .getQuestion(controller.text);
                                              final response = await blocDoubt
                                                  .postQuestion();

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(showSnackBar(
                                                      '$response'));
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      '/homePage');
                                            }
                                          }),
                                          child: const Text(Strings.submitText),
                                          style: ElevatedButton.styleFrom(
                                            primary: CustomColors
                                                .backgroungLoginColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                            minimumSize: const Size(300, 50),
                                          ))
                                    ]),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
