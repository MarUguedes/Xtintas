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
      body: Container(
        color: Colors.white,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: screenSize.height * 0.40,
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
                padding: const EdgeInsets.only(top: 25.0, right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Strings.satisfactiontitle,
                        style: CustomFont.subtitleStyle3,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  iconSize: 60,
                                  onPressed: () {},
                                  icon: Image.asset('assets/sad.png')),
                              const Text(Strings.badSatisfaction)
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 60,
                                onPressed: () {},
                                icon: Image.asset('assets/boring.png'),
                              ),
                              const Text(Strings.mediumSatisfaction)
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 60,
                                onPressed: () {},
                                icon: Image.asset('assets/in-love.png'),
                              ),
                              const Text(Strings.goodatisfaction)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.04,
                      ),
                      ElevatedButton(
                          onPressed: (() {}),
                          child: const Text(Strings.su),
                          style: ElevatedButton.styleFrom(
                            primary: CustomColors.backgroungLoginColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: const Size(300, 50),
                          ))
                    ]),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
