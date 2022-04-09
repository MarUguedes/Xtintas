import 'package:flutter/material.dart';
import 'package:xtintas/presentation/widgets/cardInfo.dart';
import 'package:xtintas/presentation/widgets/timerWidget.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

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
                  "Como pintar",
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
                  title: 'Prepare a tinta',
                  text: 'Abra a tinta e a coloque na caçamba',
                  icon: const Icon(Icons.format_color_fill),
                ),
                CardInfo(
                  index: 2,
                  title: 'Primeira demão',
                  text:
                      'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
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
                  title: 'Repasse a tinta',
                  text:
                      'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
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
                  title: 'Segunda demão',
                  text:
                      'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
                  icon: const Icon(Icons.format_paint),
                ),
                CardInfo(
                  index: 6,
                  title: 'Repasse a tinta',
                  text:
                      'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
                  icon: const Icon(Icons.format_paint),
                ),
                const TimerWidget(),
                const SizedBox(
                  height: 60,
                ),
                CardInfo(
                  index: 7,
                  title: 'Acabou',
                  text: 'Sua parede está pronta',
                )
              ],
            ),
          ),
        ));
  }
}



