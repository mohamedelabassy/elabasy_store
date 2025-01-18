import 'dart:io';

import 'package:elabasy_store/core/app/bloc_observer.dart';
import 'package:elabasy_store/core/app/env.variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'elabasy_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyD7FdIf0oqK1_1m4e6ibI5lYZWB92h4pT8',
          appId: '1:76893839862:android:64348a06b681ed62a8a7d7',
          messagingSenderId: '76893839862',
          projectId: 'elabasystore-cca1a',
        ))
      : await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then(
    (_) => runApp(const ElabasyStoreApp()),
  );
}
