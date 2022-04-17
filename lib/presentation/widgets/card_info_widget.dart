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
  Image? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Text(
              '$index',
              style: CustomFontStyle.indexStyle,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: CustomFontStyle.subtitleStyle2,
            ),
            const SizedBox(
              width: 15,
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
             
              style: CustomFontStyle.defaultTextStyle2,
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
