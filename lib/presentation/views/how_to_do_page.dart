import 'package:flutter/material.dart';
import 'package:xtintas/presentation/widgets/cardInfo.dart';
import 'package:xtintas/presentation/widgets/timerWidget.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

class HowToDoPAge extends StatelessWidget {
  const HowToDoPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: CustomColors.backgroungColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.10),
            child: Column(
              children: [
                Text(
                  Strings.howToDoTitle,
                  style: CustomFont.titleStyle2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenSize.width * 0.70,
                  height: 1,
                  color: CustomColors.borderColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                CardInfo(
                  index: 1,
                  title: Strings.stepOneTitle,
                  text: Strings.stepOneText
                  
                ,
                  icon: const Icon(Icons.format_color_fill),
                ),
                CardInfo(
                  index: 2,
                  title: Strings.stepTwoTitle,
                  text:
                      Strings.stepTwoText,
                  icon: const Icon(Icons.format_paint),
                ),
                const Icon(
                  Icons.south,
                  size: 60,
                  color: CustomColors.borderColor,
                ),
                const SizedBox(
                  height: 60,
                ),
                CardInfo(
                  index: 3,
                  title: Strings.stepThreeTitle,
                  text: Strings.stepThreeText,
                  icon: const Icon(Icons.format_paint),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TimerWidget(),
                const SizedBox(
                  height: 60,
                ),
                CardInfo(
                  index: 5,
                  title: Strings.stepFiveTitle,
                  text: Strings.stepFiveText,
                  icon: const Icon(Icons.format_paint),
                ),
                CardInfo(
                  index: 6,
                  title: Strings.stepSixTitle,
                  text:Strings.stepSixText,
                  icon: const Icon(Icons.format_paint),
                ),
                const TimerWidget(),
                const SizedBox(
                  height: 60,
                ),
                CardInfo(
                  index: 7,
                  title: Strings.stepSevenTitle,
                  text: Strings.stepSevenText,
                )
              ],
            ),
          ),
        ));
  }
}



