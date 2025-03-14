import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashController(this._service);

  SplashState _state = SplashStateInitial();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 2));
    final secureStorage = SecureStorage();
    _changeState(SplashStateLoading());
      final user = await secureStorage.readOne(key: "CURRENT_USER");
      if (user != null) {
        _changeState(SplashStateSuccess());
      } else {
        _changeState(SplashStateError());
      }
    }
}

