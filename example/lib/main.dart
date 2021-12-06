import 'package:components_qt_kit/widgets/ui_kits/kit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:components_qt_kit/widgets/ui_kits/kit_buttons.dart';
// import 'package:components_qt_kit/widgets/ui_kits/ui_appbars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controladorTeste = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Kitextfield(
                  heigth: 50,
                  padding:
                      EdgeInsets.only(left: 40, top: 4, bottom: 0, right: 20),
                  containGradient: false,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(4, 2),
                            blurRadius: 1.5,
                            spreadRadius: 1.0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  containTiltle: true,
                  mainAxisAlignmentTitle: MainAxisAlignment.start,
                  title: 'Email',
                  titleStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                  hintText: 'Usuario@gmaill.com',
                  hintTextStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                  controller: controladorTeste,
                  keyboardType: TextInputType.text,
                  border: InputBorder.none,
                  enable: true,
                  iconTextfield: false,
                  sufix: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('OOOOOOOOOOOI');
                  },
                  child: KitButton(
                    decorationButton: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(4, 2),
                              blurRadius: 1.5,
                              spreadRadius: 1.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    shadowButton: true,
                    height: 80,
                    width: 200,
                    iconSufix: const Icon(
                      Icons.accessibility_new_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                    iconSufixPadding: const EdgeInsets.all(15),
                    iconSufixDecoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    text: 'BOTÃO KIT',
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    spaceItens: 10,
                    paddingButton: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                ),
                /*  const SizedBox(
                  height: 10,
                ),
                KitButton(
                  decorationButton: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  shadowButton: false,
                  height: 80,
                  width: 200,
                  iconSufix: const Icon(
                    Icons.accessibility_new_sharp,
                    size: 25,
                    color: Colors.white,
                  ),
                  iconSufixPadding: const EdgeInsets.all(15),
                  iconSufixDecoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  text: 'BOTÃO KIT',
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  spaceItens: 10,
                  paddingButton:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTap() {
    Navigator.of(context).pop();
  }
}
