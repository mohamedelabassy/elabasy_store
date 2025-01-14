import 'package:elabasy_store/core/app/connentivity_controller.dart';
import 'package:elabasy_store/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElabasyStoreApp extends StatelessWidget {
  const ElabasyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Elabasy Store',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, widget) {
                return Scaffold(
                  body: Builder(builder: (context) {
                    ConnectivityController.instance.init();
                    return widget!;
                  }),
                );
              },
              home: Scaffold(
                appBar: AppBar(
                  title: const Text(' Elabasy Store'),
                ),
              ),
            ),
          );
        } else {
          return const MaterialApp(
            title: 'No Network ',
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}
