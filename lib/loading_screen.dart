import 'package:flutter/material.dart';

@protected
class LoadingScreen {
  final GlobalKey globalKey;

  LoadingScreen(this.globalKey);

  void show([String? text]) {
    if (globalKey.currentContext == null) return;

    showDialog<String>(
      context: globalKey.currentContext!,
      builder: (BuildContext context) => const Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator.adaptive(
                semanticsLabel: 'Linear progress indicator',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hide() {
    if (globalKey.currentContext == null) return;

    Navigator.pop(globalKey.currentContext!);
  }
}

@protected
final scaffoldGlobalKey = GlobalKey<ScaffoldState>();

@protected
var loadingScreen = LoadingScreen(scaffoldGlobalKey);
