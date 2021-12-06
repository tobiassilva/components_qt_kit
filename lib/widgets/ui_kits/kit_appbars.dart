// import 'package:flutter/material.dart';

// class KitAppBar extends StatefulWidget {
// // estrutura appbar
//   final double? heigth;
//   final BoxDecoration? boxDecoration;
//   final bool? shadowAppbar;
//   final EdgeInsets paddingAppbar;
//   // icone prefix
//   final Icon? prefixIcon;
//   final GestureTapCallback? prefixOnTap;
//   final EdgeInsets prefixPaddingIcon;
//   final BoxDecoration prefixDecorationButton;
//   // icone sufix
//   final Icon? sufixIcon;

//   final EdgeInsets? sufixPaddingIcon;
//   final BoxDecoration sufixDecorationButton;
// // titulo
//   final String text;
//   final TextStyle? textStyle;
//   final double? spacePrefixText;
//   final double? spaceSufixText;

// // Usuario e email com foto
//   final String nomeUsuario;
//   final String emailUsuario;
//   final Image? image;
//   final Function? onTapImage;

//   // clicks
//   final GestureTapCallback? sufixOnTap;

//   const KitAppBar({
//     this.heigth,
//     this.boxDecoration,
//     this.shadowAppbar = true,
//     this.paddingAppbar =
//         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     this.prefixIcon,
//     this.prefixDecorationButton = const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(50)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 7.0,
//             color: Colors.black54,
//             offset: Offset(0, 0),
//           ),
//         ]),
//     this.prefixOnTap,
//     this.prefixPaddingIcon = const EdgeInsets.all(5),
//     this.sufixIcon,
//     this.sufixDecorationButton = const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(50)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 7.0,
//             color: Colors.black54,
//             offset: Offset(0, 0),
//           ),
//         ]),
//     this.emailUsuario = '',
//     this.image,
//     this.nomeUsuario = '',
//     this.onTapImage,
//     this.sufixPaddingIcon,
//     this.text = '',
//     this.textStyle,
//     this.spacePrefixText,
//     this.spaceSufixText,
//     this.sufixOnTap,
//   });

//   @override
//   _KitAppBarState createState() => _KitAppBarState();
// }

// class _KitAppBarState extends State<KitAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.heigth,
//       decoration: widget.boxDecoration,
//       child: Row(
//         children: [
//           // prefix icon
//           GestureDetector(
//             onTap: widget.prefixOnTap,
//             child: Container(
//               // caso queira deixar um fundo no icone
//               decoration: widget.prefixDecorationButton,
//               padding: widget.prefixPaddingIcon,
//               child: widget.prefixIcon,
//             ),
//           ),
//           SizedBox(
//             width: widget.spacePrefixText,
//           ),
//           //texto
//           Text(
//             widget.text,
//             style: widget.textStyle,
//           ),
//           SizedBox(
//             width: widget.spaceSufixText,
//           ),
//           widget.nomeUsuario == null
//               ? Row(
//                   children: [
//                     GestureDetector(
//                       onTap: widget.sufixOnTap,
//                       child: Container(
//                         decoration: widget.sufixDecorationButton,
//                         child: widget.image,
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           widget.nomeUsuario,
//                           style: widget.textStyle,
//                         ),
//                         Text(
//                           widget.emailUsuario,
//                           style: widget.textStyle,
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               : Container(),
//           GestureDetector(
//             onTap: widget.sufixOnTap,
//             child: Container(
//                 // caso queira deixar um fundo no icone/imagem
//                 decoration: widget.sufixDecorationButton,
//                 padding: widget.sufixPaddingIcon,
//                 child: widget.sufixIcon),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* widgetAppBar(context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: GlobalsStyles().kPrimaryColor,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black26,
//               offset: Offset(4, 2),
//               blurRadius: 1.5,
//               spreadRadius: 1.0)
//         ],
//       ),
//       child: Row(
//         children: [
//           IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: GlobalsStyles().kBackgroundColor,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//           Expanded(
//             child: Center(
//               child: Container(
//                 alignment: Alignment.center,
//                 child: AutoSizeText(
//                   "Pesquisa de Gás",
//                   maxLines: 1,
//                   textAlign: TextAlign.center,
//                   maxFontSize: GlobalsStyles().sizeTextGrande,
//                   style: TextStyle(
//                       fontSize: GlobalsStyles().sizeTextGrande,
//                       color: GlobalsStyles().kBackgroundColor,
//                       fontFamily: GlobalsStyles().primaryFont,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//               icon: Icon(
//                 FontAwesomeIcons.bullhorn,
//                 size: 17,
//                 color: GlobalsStyles().kBackgroundColor,
//               ),
//               onPressed: () {
//                 String titulo = "Denunciar Estabelecimento";
//                 String texto =
//                     "Se o preço do gás do estabelecimento é diferente do informado no nosso aplicativo, ou você encontrou alguma irregularidade no estabelecimento.\n Denuncie Agora! ";

//                 PesquisaGasAlert(context).alertDenuncia(titulo, texto);
//               }),
//         ],
//       ),
//     );
//   } */