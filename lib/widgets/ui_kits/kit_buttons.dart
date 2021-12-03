import 'package:flutter/material.dart';

class KitButton extends StatefulWidget {
  //botao
  final double? height;
  final double? width;
  final EdgeInsets paddingButton;
  final double spaceItens;
  final BoxDecoration? decorationButton;
  final bool
      shadowButton; //caso nao informedecoration, vem sombreado como padrão

  //icon prefix
  final Icon? iconPrefix;
  final BoxDecoration? iconPrefixDecoration;
  final EdgeInsets? iconPrefixPadding;

  //icon sufixo
  final Icon? iconSufix;
  final BoxDecoration? iconSufixDecoration;
  final EdgeInsets? iconSufixPadding;

  //text
  final String text;
  final TextStyle? textStyle;
  //final EdgeInsets ?iconSufixPadding;

  const KitButton({
    this.height,
    this.width,
    this.paddingButton =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    this.iconPrefix,
    this.iconPrefixDecoration,
    this.iconPrefixPadding,
    this.iconSufix,
    this.iconSufixDecoration,
    this.iconSufixPadding,
    this.text = '',
    this.textStyle,
    this.spaceItens = 10,
    this.decorationButton,
    this.shadowButton = true,
  }) /*: super(key: key)*/;

  @override
  _KitButtonState createState() => _KitButtonState();
}

class _KitButtonState extends State<KitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: widget.paddingButton,
      decoration: widget.decorationButton ??
          BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            boxShadow: widget.shadowButton
                ? [
                    const BoxShadow(
                      blurRadius: 7.0,
                      color: Colors.black54,
                      offset: Offset(0, 0),
                    ),
                  ]
                : null,
          ),
      child: Row(
        children: [
          //iconPref
          Container(
            padding: widget.iconPrefixPadding,
            decoration: widget.iconPrefixDecoration,
            child: widget.iconPrefix,
          ),

          if (widget.iconPrefix != null && widget.text != '') SizedBox(width: widget.spaceItens,),
          //text
          Text(
            widget.text,
            style: widget.textStyle,
          ),

          if (widget.iconSufix != null && widget.text != '') SizedBox(width: widget.spaceItens,),
          //iconSufix
          Container(
            padding: widget.iconSufixPadding,
            decoration: widget.iconSufixDecoration,
            child: widget.iconSufix,
          ),
        ],
      ),
    );
  }
}
