import 'package:flutter/material.dart';
import 'package:xtintas/controller/bloc/ink_bloc.dart';
import 'package:xtintas/presentation/widgets/differentials_presentation_widget.dart';
import 'package:xtintas/presentation/widgets/ink_presentation_widget.dart';
import 'package:xtintas/utils/custom_colors.dart';
import 'package:xtintas/utils/fonts.dart';
import 'package:xtintas/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.87);
  PageController pageController2 = PageController();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final blocInk = context.read<BlocInk>();
    return Scaffold(
        backgroundColor: CustomColors.backgroungColor,
        body: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  BlocBuilder<BlocInk, BlocInkState>(builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: (() {
                          Navigator.of(context).pushNamed('/');
                        }),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
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
                    if(state.status==StatusInk.loading) CircularProgressIndicator(),
                    if (state.status==StatusInk.success)
                     Expanded(
                            child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.inks.length,
                                controller: pageController,
                                itemBuilder: ((context, index) {
                                  var currentInk = state.inks[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(top:10.0, left:10, right: 10),
                                    child: Column(
                                      children: [
                                        InkCard(
                                            currentIndex: index,
                                            pages: state.inks.length,
                                            pageController: pageController,
                                            isIndicator: true,
                                            image: currentInk.image!,
                                            name: currentInk.name!),
                                      
                                      ],
                                    ),
                                  );
                                })),
                          )
                        ,
                     if (state.status==StatusInk.success)
                        DifferentialsCard(
                            difereciais:
                                state.inks[state.currentPage].benefits!,
                            difereciaisIcons:
                                state.inks[state.currentPage].benefits!),
                                const SizedBox(height:40),
                   if (state.status==StatusInk.success) ElevatedButton(
                        onPressed: (() {
                          Navigator.of(context).pushNamed('/satisfaction');
                        }),
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
                );
              })),
        ));
  }
}
