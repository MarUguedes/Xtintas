import 'package:flutter/material.dart';
import 'package:xtintas/presentation/widgets/card_info_widget.dart';
import 'package:xtintas/presentation/widgets/timer_widget.dart';
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
          child: Column(
            children: [
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                   splashRadius: 20,
                  onPressed: (() {
                    Navigator.of(context).pushNamed('/homePage');
                  }),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenSize.width * 0.07),
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
                      text: Strings.stepOneText,
                      icon: Image.asset(
                        'assets/paint_bucket.png',
                        scale: 5,
                      ),
                    ),
                    CardInfo(
                      index: 2,
                      title: Strings.stepTwoTitle,
                      text: Strings.stepTwoText,
                      icon: Image.asset('assets/brush.png', scale: 2),
                    ),
                    const Icon(
                      Icons.south,
                      size: 50,
                      color: CustomColors.borderColor,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CardInfo(
                      index: 3,
                      title: Strings.stepThreeTitle,
                      text: Strings.stepThreeText,
                      icon: Image.asset('assets/brush.png', scale: 2),
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
                      icon: Image.asset('assets/brush.png', scale: 2),
                    ),
                    CardInfo(
                      index: 6,
                      title: Strings.stepSixTitle,
                      text: Strings.stepSixText,
                      icon: Image.asset('assets/brush.png', scale: 2),
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
            ],
          ),
        ));
  }
}
