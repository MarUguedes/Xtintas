import 'package:flutter/material.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.backgroungColor,
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: (() {
                        Navigator.of(context).pushNamed('/');
                      }),
                      icon: const Icon(Icons.arrow_back_ios))),
              Text(
                Strings.page2Title,
                style: CustomFont.subtitleStyle2,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: CustomColors.borderColor,
                height: 1,
                width: screenSize.width * 0.6,
              ),
              const SizedBox(
                height: 20,
              ),
              const InkCard(
                isIndicator: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const DiferencialsCard(),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: (() {}),
                  child: SizedBox(
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Compre aqui',
                          style: CustomFont.buttonTextStyle2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.shopping_basket)
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.backgroungLoginColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    minimumSize: const Size(100, 50),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class InkCard extends StatelessWidget {
  const InkCard({Key? key, required this.isIndicator}) : super(key: key);
  final bool isIndicator;

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
              const Icon(Icons.arrow_back_ios),
              Image.asset(
                'assets/time.png',
                scale: 2,
              ),
              const Icon(Icons.arrow_back_ios),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Nome da tinta'),
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

class DiferencialsCard extends StatelessWidget {
  const DiferencialsCard({Key? key}) : super(key: key);

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
          const Text('Diferenciais'),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [Icon(Icons.piano), Text('diferenciais')],
          ),
          Row(
            children: const [Icon(Icons.piano), Text('diferenciais')],
          ),
          Row(
            children: const [Icon(Icons.piano), Text('diferenciais')],
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
