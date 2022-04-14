import 'package:flutter/material.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

class SatisfactionPage extends StatelessWidget {
  const SatisfactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
           Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    splashRadius: 20,
                      onPressed: (() {
                        Navigator.of(context).pushNamed('/homePage');
                      }),
                      icon: const Icon(Icons.arrow_back_ios))),

              Expanded(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                     Center(
                child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                height: screenSize.height * 0.30,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
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
                    padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Strings.satisfactiontitle,
                            style: CustomFont.subtitleStyle3,
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: Image.asset('assets/sad.png')),
                                  const Text(Strings.badSatisfaction)
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: Image.asset('assets/boring.png'),
                                  ),
                                  const Text(Strings.mediumSatisfaction)
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: Image.asset('assets/in-love.png'),
                                  ),
                                  const Text(Strings.goodatisfaction)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          ElevatedButton(
                              onPressed: (() {}),
                              child: const Text(Strings.submitText),
                              style: ElevatedButton.styleFrom(
                                primary: CustomColors.backgroungLoginColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                minimumSize: const Size(250, 40),
                              ))
                        ]),
                  ),
                ),
                          ),
                        )
                        ),
              
                  ],
                ),
              ),
         
        ],
      ),
    );
  }
}
