import 'package:flutter/material.dart';
import 'package:xtintas/models/ink.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

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
      height: 170,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            'Diferenciais',
            style: CustomFont.subtitleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.difereciais.length,
              itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(bottom:4.0),
                child: Row(
                      children: [
                        Image.network(
                          widget.difereciais[index].icon!,
                          scale: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${widget.difereciais[index].name}')
                      ],
                    ),
              )
                  ),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
