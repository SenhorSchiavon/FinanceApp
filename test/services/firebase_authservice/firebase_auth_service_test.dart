import 'package:finance_app/commons/models/user_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mock/mock_firebase_auth_service.dart';


void main (){
  final user = UserModel(name: 'User', email: 'user@email.com', id: '1a2b3c4d5e');
  late MockFirebaseAuthService mockFirebaseAuthService;
  setUp((){
    mockFirebaseAuthService = MockFirebaseAuthService();
  });

  test('Test sign up sucess', () async {
    when(()=>mockFirebaseAuthService.SignUp(name: 'User', email: 'user@email.com', password: 'user@123')).thenAnswer((_)async => UserModel(name: 'User', email: 'user@email.com', id: '1a2b3c4d5e'));
    final result = await mockFirebaseAuthService.SignUp(name: 'User', email: 'user@email.com', password: 'user@123');
    expect(result, user);
  });
}