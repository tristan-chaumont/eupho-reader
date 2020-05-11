import 'package:eupho_reader/extensions/en/mangaowl/mangaowl.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        'Settings Page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white38,
        ),
      ),
    );
  }
}
