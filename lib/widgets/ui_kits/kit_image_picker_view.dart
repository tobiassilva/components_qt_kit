import 'dart:convert';

import 'package:components_qt_kit/components_qt_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

List<Asset> listImages = [];
List<dynamic> imagensConvertidas = [];

class KitImagePickerView extends StatefulWidget {
  final String title;
  final bool? containTitle;
  final double? marginHorizontal;
  final double? marginVertical;
  final String? actionBarTitle;
  final int? maxImages;
  final bool enableCamera;
  final String? allViewTitle;
  final bool? convertImage;
  final String? actionBarColor;
  final String? titleButton;

  // configuration button
  final double? height;
  final double? width;
  final BoxDecoration? boxDecorationButton;

  //icon sufixo
  final Widget? iconSufix;

  final List<dynamic>? listConverted;

  KitImagePickerView({
    this.actionBarTitle = '',
    this.containTitle,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.title = "",
    this.maxImages = 1,
    this.allViewTitle = 'Todas as imagens',
    this.enableCamera = true,
    this.convertImage = false,
    this.listConverted,
    this.actionBarColor = '#035ac9',
    this.iconSufix = const Icon(
      Icons.camera_alt,
      color: Colors.white,
    ),
    this.boxDecorationButton,
    this.height = 100,
    this.width = 300,
    this.titleButton = '',
  });

  @override
  State<KitImagePickerView> createState() => _KitImagePickerViewState();
}

class _KitImagePickerViewState extends State<KitImagePickerView> {
  bool _visibilityGridImages = false;
  bool _visibilityButton = true;

  Future<void> _getImagesStoreUser() async {
    listImages.addAll(
      await MultiImagePicker.pickImages(
        maxImages: widget.maxImages!,
        enableCamera: widget.enableCamera,
        materialOptions: MaterialOptions(
          startInAllView: true,
          actionBarColor: widget.actionBarColor!,
          actionBarTitle: widget.actionBarTitle!,
          allViewTitle: widget.allViewTitle!,
        ),
      ),
    );
  }

  Future<void> _removeImage(index) async {
    try {
      listImages.removeAt(index);
      if (listImages.isNotEmpty) {
        var aux2 = await MultiImagePicker.pickImages(
            maxImages: widget.maxImages!,
            enableCamera: true,
            materialOptions: MaterialOptions(
              startInAllView: true,
              actionBarColor: widget.actionBarColor!,
              actionBarTitle: widget.actionBarTitle!,
              allViewTitle: widget.allViewTitle!,
            ));

        setState(() {
          listImages.addAll(aux2);
        });
      } else {
        var aux2 = await MultiImagePicker.pickImages(
            maxImages: widget.maxImages!,
            enableCamera: true,
            materialOptions: MaterialOptions(
              startInAllView: true,
              actionBarColor: widget.actionBarColor!,
              actionBarTitle: widget.actionBarTitle!,
              allViewTitle: widget.allViewTitle!,
            ));

        setState(() {
          listImages.addAll(aux2);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    listImages.clear();
  }

  Future _converteImagemBase64() async {
    if (listImages.isNotEmpty) {
      for (int i = 0; i < listImages.length; i++) {
        Asset imagem = listImages[i];
        // ignore: deprecated_member_use
        ByteData byteData = await imagem.requestOriginal();
        List<int> imageData = byteData.buffer.asUint8List();
        imagensConvertidas.add(base64Encode(imageData));
      }
    }
    return imagensConvertidas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: widget.marginHorizontal!,
          vertical: widget.marginVertical!),
      child: Column(
        children: [
          widget.convertImage! ? _buttomImageConvert() : _buttomImage(),
          Visibility(
            visible: _visibilityGridImages,
            child: buildGridViewImages(),
          )
        ],
      ),
    );
  }

  Widget _buttomImage() {
    return Visibility(
      visible: _visibilityButton,
      child: KitButton(
        onTap: () async {
          await _getImagesStoreUser();
          setState(() {
            _visibilityGridImages = true;
            _visibilityButton = false;
          });
        },
        decorationButton: widget.boxDecorationButton ??
            BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.withOpacity(0.66),
                      Colors.blueAccent.withOpacity(0.6),
                    ]),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      blurRadius: 4,
                      spreadRadius: -2),
                ]),
        widgetCenter: Text(
            widget.titleButton == ''
                ? 'Adicionar Imagens'
                : widget.titleButton!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        iconSufix: widget.iconSufix ??
            Icon(
              Icons.camera,
              color: Colors.white.withOpacity(0),
            ),
      ),
    );
  }

  Widget _buttomImageConvert() {
    return Visibility(
      visible: _visibilityButton,
      child: KitButton(
        width: widget.width!,
        height: widget.height!,
        onTap: () async {
          await _getImagesStoreUser();
          await _converteImagemBase64();

          if (listImages.isNotEmpty) {
            setState(() {
              _visibilityGridImages = true;
              _visibilityButton = false;
              widget.listConverted!.addAll(imagensConvertidas);
            });
          }
        },
        decorationButton: widget.boxDecorationButton ??
            BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.withOpacity(0.66),
                      Colors.blueAccent.withOpacity(0.6),
                    ]),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      blurRadius: 4,
                      spreadRadius: -2),
                ]),
        widgetCenter: Row(
          children: [
            Text(
                widget.titleButton == ''
                    ? ' converte ImagemB64'
                    : widget.titleButton!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        iconSufix: widget.iconSufix ??
            Icon(
              Icons.camera,
              color: Colors.white.withOpacity(0),
            ),
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Widget buildGridViewImages() {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: listImages.length,
        gridDelegate: _gridConfig(),
        itemBuilder: (context, index) => mostraImagemSelecionada(index));
  }

  SliverGridDelegate _gridConfig() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: listImages.isNotEmpty ? listImages.length : 1,
      mainAxisExtent: 200,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15.0,
      childAspectRatio: 2,
    );
  }

  Widget mostraImagemSelecionada(
    index,
  ) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        AssetThumb(
          spinner: const Center(
              child: SizedBox(
                  width: 50, height: 50, child: CircularProgressIndicator())),
          asset: listImages[index],
          width: 400,
          height: 400,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.zero,
            iconSize: 25,
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: () async {
              await _removeImage(index);
            },
          ),
        ),
      ],
    );
  }
}
