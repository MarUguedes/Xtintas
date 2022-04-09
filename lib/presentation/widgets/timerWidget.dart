import 'package:flutter/material.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.timelapse_sharp,
          size: 40,
          color: CustomColors.indexColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Aguarde 2 horas',
          style: CustomFont.subtitleStyle2,
        ),
      ],
    );
  }
}