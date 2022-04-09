import 'package:flutter/material.dart';
import 'package:xtintas/utils/fonts.dart';

class CardInfo extends StatelessWidget {
  CardInfo(
      {Key? key,
      required this.index,
      required this.title,
      required this.text,
      this.icon})
      : super(key: key);
  String title;
  String text;
  int index;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Text(
              '$index',
              style: CustomFont.indexStyle,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: CustomFont.subtitleStyle2,
            ),
            const SizedBox(
              width: 26,
            ),
            icon ?? const SizedBox.shrink()
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 26, left: 26),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
             
              style: CustomFont.defaultTextStyle2,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ]),
    );
  }
}
