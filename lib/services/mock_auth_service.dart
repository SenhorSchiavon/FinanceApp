import 'package:finance_app/commons/models/user_models.dart';
import 'package:finance_app/services/auth_service.dart';

class MockAuthService implements AuthService{

  @override
  Future<UserModel> SignIn({required String email, required String password}) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      return UserModel(id: email.hashCode, email: email);
    } catch (e) {
      throw 'Erro ao logar!';
    }
  }

  @override
  Future<UserModel> SignUp({String? name, required String email, required String password}) async {
    try{
      await Future.delayed(Duration(seconds: 2));
      if(password.startsWith('123')){
        throw Exception();
      }
    return UserModel(id:email.hashCode, name:name, email:email);
    }catch(e){
      if(password.startsWith('123')){
        throw 'Senha insegura, tente outra senha.';
      };
      throw 'Erro ao cadastrar usuário';
    }
  }


}