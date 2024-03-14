import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderController extends GetxController {
  final double _height;
  final bool _showIcon;
  final IconData _icon;
  final String _subtext;

  HeaderController(this._height, this._showIcon, this._icon, this._subtext);

  double get height => _height;

  bool get showIcon => _showIcon;

  IconData get icon => _icon;

  String get subtext => _subtext;
}
