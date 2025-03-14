import 'package:finance_app/app.dart';
import 'package:finance_app/firebase_options.dart';
import 'package:finance_app/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  setupDependencies();
  runApp(const App());
}
