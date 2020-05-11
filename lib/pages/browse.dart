import 'package:eupho_reader/extensions/en/mangaowl/mangaowl.dart';
import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
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
        'Browse Page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white38,
        ),
      ),
    );
  }
}
