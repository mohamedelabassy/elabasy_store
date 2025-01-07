import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'elabasy_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: 'AIzaSyD7FdIf0oqK1_1m4e6ibI5lYZWB92h4pT8',
          appId: '1:76893839862:android:64348a06b681ed62a8a7d7',
          messagingSenderId: '76893839862',
          projectId: 'elabasystore-cca1a',
        ))
      : await Firebase.initializeApp();
  runApp(const ElabasyStoreApp());
}
