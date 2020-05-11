import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:eupho_reader/utilities/constants.dart';
import 'package:eupho_reader/router.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(EuphoR());
}

class EuphoR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set status bar to transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: euphoGrey['w800'],
      ),
    );
    return MaterialApp(
      title: 'Eupho: Reader',
      theme: ThemeData(
        scaffoldBackgroundColor: euphoGrey['w900'],
      ),
      // onGenerateRoute: (routeSettings) => Router.appRouter.generator(routeSettings)
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
