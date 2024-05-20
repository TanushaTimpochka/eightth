import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Witch() {
    if (kIsWeb) return WebPage();
    if (Platform.isAndroid) return AndroidPage();
    if (Platform.isWindows) return WinPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Witch(),
    );
  }
}

class AndroidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Android'),
      ),
    );
  }
}

class WinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Windows Page'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text('Windows'),
      ),
    );
  }
}

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Web'),
      ),
    );
  }
}
