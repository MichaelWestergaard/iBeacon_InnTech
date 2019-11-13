import 'package:flutter/material.dart';

class Button {

  Image _icon;
  String _title;
  String _route;

  Button(this._icon, this._title, this._route);

  String get route => _route;

  set route(String value) {
    _route = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Image get icon => _icon;

  set icon(Image value) {
    _icon = value;
  }


}