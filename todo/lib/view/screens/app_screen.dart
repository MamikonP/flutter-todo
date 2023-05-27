import 'package:flutter/material.dart';


class AppScreen extends StatelessWidget {
  const AppScreen(
      {required this.content,
      this.appBar,
      this.floatingActionButton,
      super.key});

  final Widget content;
  final AppBar? appBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: content,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
