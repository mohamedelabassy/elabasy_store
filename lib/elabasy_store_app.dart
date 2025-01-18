import 'package:elabasy_store/core/app/connentivity_controller.dart';
import 'package:elabasy_store/core/routes/app_routes.dart';
import 'package:elabasy_store/core/common/screens/no_network_screen.dart';
import 'package:elabasy_store/core/language/app_localizations_setup.dart';
import 'package:elabasy_store/core/style/theme/app_theme.dart';
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
              theme: themeDark(),
              locale: Locale("en"), // اللغه الاساسية
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              builder: (context, widget) {
                return GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                    body: Builder(builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    }),
                  ),
                );
              },
              initialRoute: AppRoutes.login,
              onGenerateRoute: (settings) =>
                  AppRoutes.oneGenerateRoute(settings),
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
