import 'package:finance_app/commons/models/user_models.dart';

abstract class AuthService{
  Future<UserModel> SignUp({String? name, required String email, required String password}){
    return Future.delayed(Duration(seconds: 2));
  }
  Future SignIn({required String email, required String password}){
    return Future.delayed(Duration(seconds: 2));
  }

}