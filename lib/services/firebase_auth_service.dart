import 'package:finance_app/commons/models/user_models.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService{
  final _auth = FirebaseAuth.instance;

  Future<UserModel> SignUp({String? name, required String email, required String password}) async {
    try{
      final result = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(result.user != null){
        await result.user!.updateDisplayName(name);
        return UserModel(
          id: _auth.currentUser?.uid,
          name: _auth.currentUser?.displayName ?? '',
          email: _auth.currentUser?.email ?? '',
        );
      }else{
        throw Exception("Erro ao cadastrar usuário");
      }

    } on FirebaseAuthException catch(e){
        throw e.message ?? ('Erro ao cadastrar usuário');
    }
  }
  Future SignIn({required String email, required String password}) async{
    try{
      final result = await  _auth.signInWithEmailAndPassword(email: email, password: password);
      if(result.user != null){
        return UserModel(
          id: result.user!.uid,
          name: result.user!.displayName ?? '',
          email: result.user!.email ?? '',
        );
      }else{
        throw Exception("Erro ao Logar!");
      }

    } on FirebaseAuthException catch(e){
      throw e.message ?? ('Erro ao Logar!');
    }  }

  @override
  Future SignOut() async {
    try{
      await _auth.signOut();
    }catch(e){
      rethrow;
    }
    throw UnimplementedError();
  }
}