import 'package:flutter/material.dart';
import 'package:xtintas/models/ink.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';

class DifferentialsCard extends StatelessWidget {
  DifferentialsCard(
      {Key? key, required this.difereciais, required this.difereciaisIcons})
      : super(key: key);
  List<Benefits> difereciais;
  List<Benefits> difereciaisIcons;

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
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text('Diferenciais',style: CustomFont.subtitleStyle3,),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: difereciais.length,
              itemBuilder: ((context, index) => Row(
                    children: [
                      Image.network(
                        difereciais[index].icon!,
                        scale: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${difereciais[index].name}')
                    ],
                  )),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
