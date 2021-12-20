import 'package:flutter/material.dart';

class KitButton extends StatefulWidget {
  //botao
  final double height;
  final double width;
  final EdgeInsets paddingButton;
  final EdgeInsets marginButton;
  final double spaceItens;
  final BoxDecoration? decorationButton;
  final bool shadowButton;
  final MainAxisAlignment? mainAxisAlignment;
  //caso nao informedecoration, vem sombreado como padrão

  //icon prefix
  final Icon? iconPrefix;
  final BoxDecoration? iconPrefixDecoration;
  final EdgeInsets? iconPrefixPadding;

  //icon sufixo
  final Icon? iconSufix;
  final BoxDecoration? iconSufixDecoration;
  final EdgeInsets? iconSufixPadding;

  //text
  String text;
  final TextStyle textStyle;
  //final EdgeInsets ?iconSufixPadding;

  // clique
  final GestureTapCallback? onTap;

  KitButton(
      {this.height = 80,
      this.width = 200,
      this.paddingButton =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      this.marginButton = const EdgeInsets.all(8),
      this.iconPrefix,
      this.iconPrefixDecoration,
      this.iconPrefixPadding,
      this.iconSufix,
      this.iconSufixDecoration,
      this.iconSufixPadding,
      this.text = 'KIT BUTTONS',
      this.textStyle = const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      this.spaceItens = 10,
      this.decorationButton,
      this.mainAxisAlignment,
      this.shadowButton = true,
      this.onTap}) /*: super(key: key)*/;

  @override
  _KitButtonState createState() => _KitButtonState();
}

class _KitButtonState extends State<KitButton> {
  void changedColor() {
    setState(() {
      cor = !cor;
    });
    if (cor) {
      setState(() {
        widget.text = "QT KIT";
        cor1 = Colors.orangeAccent;
        cor2 = Colors.deepOrange;
      });
    } else {
      setState(() {
        widget.text = "KIT BUTTON";

        cor1 = Colors.lightBlue;
        cor2 = Colors.lightBlueAccent;
      });
    }
  }

  bool cor = false;
  Color cor1 = Colors.lightBlue;
  Color cor2 = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap == null
          ? () {
              changedColor();
            }
          : widget.onTap!,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: widget.paddingButton,
        decoration: widget.decorationButton ??
            BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [cor1, cor2]),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              boxShadow: widget.shadowButton
                  ? [
                      const BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4, 4),
                          blurRadius: 4,
                          spreadRadius: -2)
                    ]
                  : null,
            ),
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment == null
              ? MainAxisAlignment.center
              : widget.mainAxisAlignment!,
          children: [
            //iconPref
            Container(
              padding: widget.iconPrefixPadding,
              decoration: widget.iconPrefixDecoration,
              child: widget.iconPrefix,
            ),

            if (widget.iconPrefix != null && widget.text != '')
              SizedBox(
                width: widget.spaceItens,
              ),
            //text
            Text(
              widget.text,
              style: widget.textStyle,
            ),

            if (widget.iconSufix != null && widget.text != '')
              SizedBox(
                width: widget.spaceItens,
              ),
            //iconSufix
            Container(
              padding: widget.iconSufixPadding,
              decoration: widget.iconSufixDecoration,
              child: widget.iconSufix,
            ),
          ],
        ),
      ),
    );
  }
}
