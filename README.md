Components_qt_kits
	A ideia principal é a componentização de widgets, que nada mais é do que um widget global ou até mesmo uma função de requisição , por exemplo. 


Funcionamento:
 importar package ‘components_qt_kit’ em seu arq pubspec.yaml

“components_qt_kit:
      git:
        url: https://github.com/tobiassilva/components_qt_kit.git
”
importar no arquivo
import 'package:components_qt_kit/src/quadrant_requests.dart';
Chama o tipo que você quer. Nesse caso eu estou importando algumas funções de requisição.

chama o widget/function no codigo

Future getDados() async {
    var res = await RequestsComponents().getComParametros(
        "${GlobalsInformations().urlProcon}/pesquisa_data.php}",
        "?id=3&procon_id=${GlobalsInformations().idProcon}");
 
    print("res: $res");
  }
 


	Estrutura usada : NomeClasse().nomefuncao(url, outroParam);

Caso for um widget:
 GestureDetector(
                  onTap: () {
                    print('OOOOOOOOOOOI');
                  },
                  child: KitButton(
                    decorationButton: const BoxDecoration(
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
 
	
para utilizar o botão e os demais Widgets basta:
NomeClasse(
Ctrl + espaço => para ver os parâmetros que esse widget possui 
Em caso de não saber o que o parâmetro recebe faça: Ctrl + clique(esquerdo)
);
