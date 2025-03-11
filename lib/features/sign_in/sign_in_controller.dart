import 'dart:developer';

import 'package:finance_app/features/sign_in/sign_in_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInState _state = SignInStateInitial();

  SignInController(this._service);

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }
  Future<void> SignIn({required String email, required String password}) async{
    _changeState(SignInStateLoading());
    try{
      await _service.SignIn(email: email, password: password);
      log("Usuário Logado!");
      _changeState(SignInStateSuccess());
    }catch(e){
      _changeState(SignInStateError());
    }
  }
}

