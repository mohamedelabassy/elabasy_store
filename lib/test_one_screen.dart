import 'package:elabasy_store/core/app/routes/app_routes.dart';
import 'package:elabasy_store/core/extensions/const_extensions.dart';
import 'package:flutter/material.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text(
          "Test one Screen",
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushNamed(AppRoutes.testTwo);
          },
          child: Text("sssssss"),
        ),
      ),
    );
  }
}
