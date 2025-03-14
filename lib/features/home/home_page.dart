import 'package:finance_app/commons/constants/routes.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Nova tela"),
        ElevatedButton(onPressed: (){
           _secureStorage.deleteOne(key:"CURRENT_USER").then(
               (_)=>Navigator.pushReplacementNamed(context, NamedRoute.initial)
           );
        }, child: Text("Logout"),)
      ],
    ),),);
  }
}