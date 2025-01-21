import 'package:elabasy_store/core/app/connentivity_controller.dart';
import 'package:elabasy_store/core/app/cubit/app_cubit.dart';
import 'package:elabasy_store/core/di/injecttion_container.dart';
import 'package:elabasy_store/core/routes/app_routes.dart';
import 'package:elabasy_store/core/common/screens/no_network_screen.dart';
import 'package:elabasy_store/core/language/app_localizations_setup.dart';
import 'package:elabasy_store/core/services/shared_pref/pref_keys.dart';
import 'package:elabasy_store/core/services/shared_pref/shared_pref.dart';
import 'package:elabasy_store/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElabasyStoreApp extends StatelessWidget {
  const ElabasyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'Elabasy Store',
                    debugShowCheckedModeBanner: false,
                    theme: cubit.isDark ? themeLight() : themeDark(),
                    locale: Locale(cubit.currentLangCode), // اللغه الاساسية
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        child: Scaffold(
                          body: Builder(builder: (context) {
                            ConnectivityController.instance.init();
                            return widget!;
                          }),
                        ),
                      );
                    },
                    initialRoute: SharedPref()
                                .getString(PrefKeys.accessToken) !=
                            null
                        ? SharedPref().getString(PrefKeys.userRole) == 'admin'
                            ? AppRoutes.homeCustomer
                            : AppRoutes.homeAdmin
                        : AppRoutes.login,
                    onGenerateRoute: AppRoutes.oneGenerateRoute,
                  );
                },
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
