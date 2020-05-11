import 'package:eupho_reader/pages/browse.dart';
import 'package:eupho_reader/pages/home_page.dart';
import 'package:eupho_reader/pages/recents.dart';
import 'package:eupho_reader/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:eupho_reader/pages/library.dart';

class FluroRouter {

  static Router router = Router();

  static void setupRouter() {
    router
      ..define(
        '/',
        handler: Handler(handlerFunc: (context, params) => HomePage()),
      )
      ..define(
        'library',
        handler: Handler(handlerFunc: (context, params) => Library()),
      )
      ..define(
        'recents',
        handler: Handler(handlerFunc: (context, params) => Recents()),
      )
      ..define(
        'browse',
        handler: Handler(handlerFunc: (context, params) => Browse()),
      )
      ..define(
        'settings',
        handler: Handler(handlerFunc: (context, params) => Settings()),
      );
  }
}
