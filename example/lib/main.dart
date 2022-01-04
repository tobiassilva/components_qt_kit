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

  var carregando = false;
  // @override
  // void initState() {
  //   super.initState();
  //   getR();
  // }

  final controladorTeste = TextEditingController();
  var icone = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          body: carregando
              ? CircularProgressIndicator()
              : KitTextfield(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  heigth: 50,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  mainAxisAlignmentTitle: MainAxisAlignment.center,
                  containTiltle: false,
                  enable: true,
                  title: "Senha ",
                  titleStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  controller: controladorTeste,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  maxlines: 1,
                  sufix: IconButton(onPressed: null, icon: Icon(icone)),
                  decorationWithOutline: false,
                  colorBorderSide: Colors.blue,
                  widthBorderSide: 1,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: true,
                  prefix: null,
                  textInTextField: 'Senha ',
                  textStyleInTextField: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }

  onTap() {
    Navigator.of(context).pop();
  }
}
