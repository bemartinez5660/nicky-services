import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 405 /
          587, // Reemplaza 'anchoSvg' y 'altoSvg' con las dimensiones reales de tu archivo SVG
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            // height: 487,
            child: SvgPicture.asset(
              'assets/images/header.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
