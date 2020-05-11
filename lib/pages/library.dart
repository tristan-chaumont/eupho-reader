import 'package:eupho_reader/extensions/en/mangaowl/mangaowl.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:http/http.dart' as http;
import '../book/book.dart';
import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  Future<Widget> futureOnePiece;

  @override
  void initState() {
    super.initState();
    futureOnePiece = MangaOwl().getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    /*return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 100,
          ),
          child: FutureBuilder(
            future: futureOnePiece,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
              } else if (snapshot.hasError) {
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );*/
  }
}
