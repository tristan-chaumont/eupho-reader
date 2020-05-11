import 'package:eupho_reader/extensions/en/mangaowl/mangaowl.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: Text(
        'Library Page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white38,
        ),
      ),
    );
  }
}
