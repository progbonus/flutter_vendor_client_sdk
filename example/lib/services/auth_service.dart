import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_result/fluent_result.dart';
import 'package:get/get.dart';
import 'package:speed_up_get/speed_up_get.dart';

class AuthService extends GetxService with GetxSubscribing {
  final _auth = FirebaseAuth.instance;

  final _idToken = ''.obs;
  String get idToken => _idToken.value;

  final _user = Rxn<User>();
  User? get user => _user.value;

  bool get isAuth => user != null;

  @override
  Future onReady() async {
    super.onReady();

    subscribe(_auth.userChanges(), (User? user) async {
      _user(user);
      if (user == null) {
        _idToken('');
        return;
      }
      final token = await user.getIdToken();
      print('Firebase ID Token: $token');
      _idToken(token);
    });
  }

  Future<Result> loginWithUsernameAndPassword({
    required String email,
    required String password,
  }) async {
    //

    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return Result.withErrorMessage('some error');
      }

      return Result.ok;
    } catch (e) {
      print(e);
      return Result.withException(e as Exception);
    }
  }
}
