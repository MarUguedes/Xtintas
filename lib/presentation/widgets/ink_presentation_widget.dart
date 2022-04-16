import 'package:flutter/material.dart';
import 'package:xtintas/controller/bloc/ink_bloc.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InkCard extends StatelessWidget {
  const InkCard(
      {Key? key,
      required this.pageController,
      required this.pages,
      required this.isIndicator,
      required this.image,
      required this.currentIndex,
      required this.name})
      : super(key: key);
  final bool isIndicator;
  final currentIndex;
  final pages;
  final String image;
  final String name;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final blocInk = context.read<BlocInk>();
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
      height: screenSize.height * 0.37,
      width: screenSize.width * 0.91,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  if (currentIndex > 0) {
                    
                    pageController.jumpToPage(currentIndex - 1);
                    blocInk.setCurrentPage(currentIndex - 1);
                  } else {
                    pageController.jumpToPage(pages - 1);
                    blocInk.setCurrentPage(pages - 1);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
                color: CustomColors.borderColor,
              ),
              Image.network(
                image,
                scale: 8,
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: (() {
                  if (currentIndex < pages - 1) {
                    pageController.jumpToPage(currentIndex + 1);
                    blocInk.setCurrentPage(currentIndex + 1);
                  } else {
                    pageController.jumpToPage(0);
                    blocInk.setCurrentPage(0);
                  }
                }),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 40,
                ),
                color: CustomColors.borderColor,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(name, style: CustomFont.subtitleStyle3, textAlign: TextAlign.center,),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pushNamed('/howToDo');
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
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
                  padding: const EdgeInsets.symmetric(vertical: 7),
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
          ),
          const SizedBox(
            height: 8,
          )
        ]),
      ),
    );
  }
}
