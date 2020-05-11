import 'package:eupho_reader/extensions/en/mangaowl/mangaowl.dart';
import 'package:flutter/material.dart';

class Recents extends StatefulWidget {
  @override
  _RecentsState createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
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
        'Recents Page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white38,
        ),
      ),
    );
  }
}
