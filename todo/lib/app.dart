import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text('Initial'),
    );
  }
}