import 'package:flutter/material.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

class InkCard extends StatelessWidget {
  const InkCard({Key? key, required this.isIndicator, required this.image, required this.name}) : super(key: key);
  final bool isIndicator;
  final String image;
  final String name;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: const Offset(0, 1),
              blurRadius: 4,
            )
          ]),
      height: 250,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          isIndicator
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: CustomColors.buttomIndicatorColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Indicação',
                        style: CustomFont.buttonTextStyle,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.arrow_back,
                color: CustomColors.borderColor,
                size: 40,
              ),
              Image.network(
                image,
                scale: 8,
              ),
              const Icon(
                Icons.arrow_forward,
                color: CustomColors.borderColor,
                size: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
           Text('$name'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pushNamed('/howToDo');
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Como pintar',
                      style: CustomFont.buttonTextStyle2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.backgroungLoginColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      bottomLeft: Radius.circular(26.0),
                    )),
                  )),
              const SizedBox(
                width: 2,
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed('/makeAQuestion');
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Tirar dúvidas',
                    style: CustomFont.buttonTextStyle2,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.buttomSecondaryColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.0),
                    bottomRight: Radius.circular(26.0),
                  )),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
