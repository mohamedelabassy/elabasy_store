import 'package:flutter/material.dart';

class ElabasyStoreApp extends StatelessWidget {
  const ElabasyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Elabasy Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(' Elabasy Store'),
          ),
        ));
  }
}
