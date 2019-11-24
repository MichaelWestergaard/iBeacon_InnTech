import 'package:flutter/material.dart';

class Button {

  String _icon;
  String _title;
  String _route;

  Button(this._icon, this._title, this._route);


  Button.name(this._title);

  String get route => _route;

  set route(String value) {
    _route = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }


}