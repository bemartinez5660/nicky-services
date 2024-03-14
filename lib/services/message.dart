// ignore_for_file: constant_identifier_names

import 'package:cleanserv/common/theme_helper.dart';
import 'package:cleanserv/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


///
/// Color del tema principal para los diferentes cuadros de
/// diálogos utilizados.
///
const Color appMessageThemeColor = AppColors.azulOscuro;

///
/// Radio del borde del tema principal para los diferentes
/// cuadros de diálogos utilizados.
///
const double appMessageThemeRadius = 16;

///
/// Indica el tipo de organización del elemento dentro del componente.
/// Si es [COL] se mostrara el elemento como una fila, similar a una
/// una lista de elementos. Por el contrario, si es [ROW], se mostrara
/// el elementos como una columna.
///
enum ActionSheetElementType { COL, ROW }

///
/// Servicio de mensajes personalizados basados en el uso del Framework
/// Reactivo [GetX] para renderizar y administrar los mismos.
///
class Message extends GetxService {
  static Message get service => Get.find();
  Future<Message> init() async => this;

  ///
  ///
  ///
  alert(
    BuildContext context, {
    String title = 'Información',
    String message = 'Información contenido',
    String? buttonLabel = 'OK',
    VoidCallback? onClick,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (content) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            // ...
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: const Size(20, 20),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.negroOscuro,
                ),
              ),
            ),

            // ...
            const SizedBox(height: 5),
            // ...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.negroOscuro,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 33),
            // ...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.negroOscuro,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            // ...
            const SizedBox(height: 33),
            // ...
            // ElevatedButton(
            //   onPressed: () => Navigator.of(context).pop(),
            //   child: const Text('Acept'),
            // ),
            CupertinoButton(
              child: Container(
                width: 230,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.azulOscuro,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  buttonLabel ?? 'OK',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // ...
                onClick?.call();
              },
            ),
            const SizedBox(height: 33),
            // ...
          ],
        ),
        // title: const Text('OK'),
        // content: const Text('data'),
        // actions: [
        //   // OutlinedButton(onPressed: (){}, child: child)
        //   Padding(
        //     padding: const EdgeInsets.only(right: 5),
        //     child: ElevatedButton(
        //       onPressed: () => Navigator.of(context).pop(),
        //       child: const Text('Acept'),
        //     ),
        //   ),
        // ],
      ),
    );
  }

  // ...

  ///
  /// Cuadro de diálogo [CONFIRM] que simula un mensaje de
  /// confirmación del sistema. Ejemplo:
  ///
  /// ```dart
  /// Message.service.confirm(
  ///   title: 'Confirmación',
  ///   message: '¿Estás seguro de que quieres cerrar esta aplicación?',
  ///   confirmLabel: 'Si',
  ///   cancelLabel: 'No',
  ///   onConfirm: () => exit(0),
  ///   onCancel: () {},
  /// )
  /// ```
  ///
  Future<bool?> confirm<bool>(
    BuildContext context, {
    String title = 'Confirmación',
    String message = 'Confirmación contenido',
    String? confirmLabel = 'OK',
    String? cancelLabel = 'Cancelar',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (content) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            // ...
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  onCancel?.call();
                },
                style: ThemeHelper().buttonStyle(),
                child: const Icon(
                  Icons.close,
                  color: AppColors.negroOscuro,
                ),
              ),
            ),
            // ...
            const SizedBox(height: 5),
            // ...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.negroOscuro,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 33),
            // ...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.negroOscuro,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            // ...
            const SizedBox(height: 33),
            // ...
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ...
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          confirmLabel ?? 'ok'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        onConfirm?.call();
                      },
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.back();
                  //     onConfirm?.call();
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.azulOscuro,
                  //       borderRadius: BorderRadius.circular(16),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 15),
                  //       child: Text(
                  //         confirmLabel ?? 'OK',
                  //         style: const TextStyle(
                  //           fontSize: 20,
                  //           fontFamily: 'Poppins',
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ...
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          cancelLabel ?? 'Cancel',
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        onCancel?.call();
                      },
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.back();
                  //     onCancel?.call();
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.azulOscuro,
                  //       borderRadius: BorderRadius.circular(16),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 15),
                  //       child: Text(
                  //         cancelLabel ?? 'Cancel',
                  //         style: const TextStyle(
                  //           fontSize: 20,
                  //           fontFamily: 'Poppins',
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            // ...
          ],
        ),
      ),
    );
  }

  ///
  /// Cuadro de diálogo [ACTION SHEET] que simula un
  /// menu de opciones en la parte inferior del
  /// sistema. Ejemplo:
  ///
  /// ```dart
  /// List<Widget> list = <Widget>[
  ///   ActionSheetElement(
  ///     icon: Icon(Icons.share),
  ///     text: 'Share',
  ///     type: ActionSheetElementType.ROW,
  ///     onPress: () {},
  ///   ),
  ///   ActionSheetElement(
  ///     icon: Icon(Icons.camera),
  ///     text: 'Camera',
  ///     type: ActionSheetElementType.ROW,
  ///   ),
  ///   ActionSheetElement(
  ///     icon: Icon(Icons.watch),
  ///     text: 'Watch',
  ///     onPress: () {},
  ///     type: ActionSheetElementType.ROW,
  ///   ),
  /// ];
  ///
  /// Message.service.actionSheet(
  ///   title: 'Albums',
  ///   elements: list,
  ///   height: 100,
  /// );
  ///
  /// ```
  ///
  actionSheet({
    required String title,
    required double height,
    required List<Widget> elements,
  }) {
    if (_isActiveLoading) {
      dismissLoading();
    }
    return Get.bottomSheet(
      Wrap(
        children: [
          HeaderActionSheet(title: title),
          ListActionSheet(
            contentHeight: height,
            children: elements,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: false,
    );
  }

  // ...

  bool _isActiveLoading = false;
  bool get isActiveLoading => _isActiveLoading;

  void dismissLoading() {
    if (_isActiveLoading) {
      _isActiveLoading = false;
      Get.back();
    }
  }

  void presentLoading({
    Color? progressColor,
    Color? backgroundColor,
  }) {
    if (!_isActiveLoading) {
      _isActiveLoading = true;
      Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: backgroundColor ?? AppColors.grisOscuro,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      progressColor ?? AppColors.azulOscuro),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }

  // ...
}

class HeaderActionSheet extends StatelessWidget {
  const HeaderActionSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appMessageThemeColor,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ListActionSheet extends StatelessWidget {
  const ListActionSheet({
    Key? key,
    this.contentHeight,
    this.children,
  }) : super(key: key);

  final double? contentHeight;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: contentHeight,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          children: children ?? [],
        ),
      ),
    );
  }
}

class ActionSheetColsElement extends StatelessWidget {
  const ActionSheetColsElement({
    Key? key,
    this.icon,
    this.text,
    this.onPress,
  }) : super(key: key);

  final Widget? icon;
  final String? text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text ?? ''),
      onTap: () {
        Get.back();
        onPress?.call();
      },
    );
  }
}

class ActionSheetRowsElement extends StatelessWidget {
  const ActionSheetRowsElement({
    Key? key,
    this.icon,
    this.text,
    this.onPress,
  }) : super(key: key);

  final Widget? icon;
  final String? text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: TextButton(
        // height: 80,
        child: Column(
          children: [
            icon ?? Container(),
            const SizedBox(height: 5),
            Text(text ?? ''),
          ],
        ),
        onPressed: () {
          Get.back();
          onPress?.call();
        },
      ),
    );
  }
}

class ActionSheetElement extends StatelessWidget {
  ///
  /// Elemento del componente [ACTION SHEET] que se ajustará
  /// y renderizará acorde al tipo de elemento descrito por
  /// su propiedad [TYPE]. Ejemplo:
  ///
  /// ```dart
  /// ActionSheetElement(
  ///   icon: Icon(Icons.share),
  ///   text: 'Share',
  ///   type: ActionSheetElementType.ROW,
  ///   onPress: () {},
  /// ),
  /// ```
  ///
  const ActionSheetElement({
    Key? key,
    required this.icon,
    required this.text,
    required this.type,
    this.onPress,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final VoidCallback? onPress;
  final ActionSheetElementType type;

  @override
  Widget build(BuildContext context) {
    return type != ActionSheetElementType.ROW
        ? ActionSheetColsElement(
            icon: icon,
            text: text,
            onPress: onPress,
          )
        : ActionSheetRowsElement(
            icon: icon,
            text: text,
            onPress: onPress,
          );
  }
}
