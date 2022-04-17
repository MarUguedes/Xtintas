import 'package:flutter/material.dart';
import 'package:xtintas/models/ink.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

class DifferentialsCard extends StatefulWidget {
  DifferentialsCard(
      {Key? key, required this.difereciais, required this.difereciaisIcons})
      : super(key: key);
  List<Benefits> difereciais;
  List<Benefits> difereciaisIcons;

  @override
  State<DifferentialsCard> createState() => _DifferentialsCardState();
}

class _DifferentialsCardState extends State<DifferentialsCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
      height: screenSize.height * 0.20,
      width: screenSize.width * 0.82,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            Strings.diferencialsTitle,
            style: CustomFontStyle.subtitleStyle,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.difereciais.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Image.network(
                          widget.difereciais[index].icon!,
                          scale: 13,
                          semanticLabel:
                              ' Icone do diferêncial',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${widget.difereciais[index].name}')
                      ],
                    ),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
