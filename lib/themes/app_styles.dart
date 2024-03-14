import 'package:flutter/material.dart';

class AppStyles {
  // ...
  // INPUTS
  // ...

  ///
  /// Estilos de los inputs de textos [Válidos]
  ///
  static const inputsTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    // letterSpacing: 0.5,
  );

  ///
  /// Estilos de los inputs de textos [Erroneos]
  ///
  static const inputsTextErrorStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    // color: AppColors.errorColor,
  );

  ///
  /// Estilos de los inputs de textos cuando estan en los
  /// estados [enabledBorder] y [focusedBorder]
  ///
  static const inputsBorderOK = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1,
    ),
  );

  ///
  /// Estilos de los inputs de textos cuando estan en los
  /// estados [errorBorder] y [focusedErrorBorder]
  ///
  static const inputsBorderError = UnderlineInputBorder(
    borderSide: BorderSide(
      // color: AppColors.errorColor!,
      width: 1,
    ),
  );

  // ...
}
