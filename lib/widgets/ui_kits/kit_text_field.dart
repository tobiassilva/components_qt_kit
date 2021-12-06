import 'package:flutter/material.dart';

class Kitextfield extends StatefulWidget {
  // estrutura textfield
  // tamanho container
  final double? heigth;
  final double? width;

  // variavel ferificar se quer só o gradient no decoration
  final bool containGradient;
  // gradient container e textfield
  final Color? colorGradient;
  final Color? colorGradient2;
  final Alignment? alignmentGradientBegin;
  final Alignment? alignmentGradientEnd;
  // para definir borda container
  final BoxDecoration? decoration;
  // padding e margin do container
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  // cor container
  final Color? colorTextField;

  // define a posicao do titulo
  final MainAxisAlignment? mainAxisAlignmentTitle;
  // verifica se existe titulo para forms
  final bool? containTiltle;
  final String title;

  // atributos textField
  final bool iconTextfield;
  final TextInputType? keyboardType;
  final Icon? prefix;
  final Icon? sufix;

  final TextStyle? titleStyle;

  // em desenvolvimento > final bool? defaultTextField;

  // texto textField
  final String hintText;
  final TextStyle? hintTextStyle;
  // estrutura do textField

  final InputBorder? border;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxlines;
  final int? minlines;
  // habilita textField
  final bool enable;
  final bool enableSuggestions;
  //
  final ValueChanged<String>? onChanged;

  const Kitextfield({
    this.heigth,
    this.width,
    this.decoration,
    this.padding,
    this.margin,
    this.colorGradient,
    this.colorGradient2,
    this.containTiltle = true,
    this.title = 'components UI',
    this.titleStyle,
    this.onChanged,
    this.hintText = '',
    this.hintTextStyle,
    this.border,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.prefix,
    this.sufix,
    this.iconTextfield = false,
    this.maxlines,
    this.minlines,
    this.colorTextField,
    this.containGradient = true,
    this.alignmentGradientBegin,
    this.alignmentGradientEnd,
    this.mainAxisAlignmentTitle,
    this.enable = false,
    this.enableSuggestions = false,
  });

  @override
  _KitextfieldState createState() => _KitextfieldState();
}

class _KitextfieldState extends State<Kitextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.containTiltle!
            ? Container(
                margin:
                    widget.margin ?? const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment:
                      widget.mainAxisAlignmentTitle ?? MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: widget.titleStyle,
                    ),
                  ],
                ),
              )
            : const Text(''),
        Container(
            height: widget.heigth,
            width: widget.width,
            decoration: widget.decoration ??
                BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: widget.colorTextField ?? Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(4, 2),
                        blurRadius: 1.5,
                        spreadRadius: 1.0)
                  ],
                  gradient: widget.containGradient
                      ? LinearGradient(
                          begin: widget.alignmentGradientBegin ??
                              Alignment.topLeft,
                          end: widget.alignmentGradientEnd ??
                              Alignment.centerRight,
                          colors: [
                              widget.colorGradient ?? Colors.blue,
                              widget.colorGradient2 ?? Colors.white,
                            ])
                      : const LinearGradient(colors: [
                          Colors.white,
                          Colors.white,
                        ]),
                ),
            padding: widget.padding,
            margin: widget.margin,
            child: TextField(
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              obscureText: widget.obscureText,
              controller: widget.controller,
              enableSuggestions: widget.enableSuggestions,
              minLines: widget.minlines,
              maxLines: widget.maxlines,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle,
                border: widget.border,
                enabled: widget.enable,
                suffixIcon:
                    widget.iconTextfield ? const Icon(Icons.add) : widget.sufix,
                prefix: widget.iconTextfield
                    ? const Icon(Icons.add)
                    : widget.prefix,
              ),
            )),
      ],
    );
  }
}
