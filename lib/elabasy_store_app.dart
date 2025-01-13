import 'package:flutter/material.dart';

class ElabasyStoreApp extends StatelessWidget {
  const ElabasyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Elabasy Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(' Elabasy Store'),
          ),
        ));
  }
}
