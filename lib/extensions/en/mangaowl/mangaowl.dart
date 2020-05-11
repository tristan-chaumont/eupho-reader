import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class MangaOwl {
  final _onePieceUrl = 'https://mangaowl.net/single/NTV6/one-piece';

  Future<Widget> getImage() async {
    final response = await http.Client().get(Uri.parse(_onePieceUrl));

    if (response.statusCode == 200) {
      Document document = parse(response.body);
      print(document.getElementsByClassName('hidden-xs col-md-4 col-md-offset-0 single-right-grid-left'));
    } else 
      throw Exception();
  }
  
}