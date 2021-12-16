import 'dart:convert';

import 'package:components_qt_kit/components_qt_kit.dart';
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
  Future getR() async {
    var data = {
      'session':
          'bf16fe8c76219f4051a457a1858d96b98e73e3a6f88748668ab954819293a865',
    };
    var request = await RequestsComponents().getComParametros(
        "https://itajuba.myscriptcase.com/prefeitura/api/cidadao.php",
        'bf16fe8c76219f4051a457a1858d96b98e73e3a6f88748668ab954819293a865');
    // await RequestsComponents().testando();
    var decode = jsonDecode(request[request.length - 1]);
    print('Decode ::: ${decode['retorno']}');
    setState(() {
      carregando = false;
    });

    // print('retorno: ${Testando().retorno}');
    // print('mensagem: ${Testando().mensagem}');
    // print('conexao: ${Testando().conexao}');
    // print('requisicaoUrl: ${Testando().requisicaoUrl}');
  }

  var carregando = true;
  @override
  void initState() {
    super.initState();
    getR();
  }

  final controladorTeste = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          body: carregando ? CircularProgressIndicator() : Container(),
        ),
      ),
    );
  }

  onTap() {
    Navigator.of(context).pop();
  }
}

class asd extends StatelessWidget {
  const asd({
    Key? key,
    required this.controladorTeste,
  }) : super(key: key);

  final TextEditingController controladorTeste;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KitButton(
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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          spaceItens: 10,
          paddingButton:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ],
    );
  }
}
