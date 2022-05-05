import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/app/data/services/api_response.dart';


class UserRepository {

  final FirebaseAuth auth = FirebaseAuth.instance;

  UserRepository();

  Future<ApiResponse> register(Map<String, dynamic> data) async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      return ApiResponse(
        isSuccessful: true,
        message: 'Account created succesfully',
        data: userCredential.credential?.token,
      );
    } on FirebaseAuthException catch (e) {
      return _authResponse(e);
    }
  }

  Future<ApiResponse> login(Map<String, dynamic> data) async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
     
      return ApiResponse(
          isSuccessful: true,
          message: 'Welcome back',
          data: userCredential.credential?.token);
    } on FirebaseAuthException catch (e) {
      return _authResponse(e);
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  ApiResponse _authResponse(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return ApiResponse(
          isSuccessful: false,
          message: 'User with email or password does not exist',
        );
      case 'wrong-password':
        return ApiResponse(
          isSuccessful: false,
          message: 'User with email or password does not exist',
        );
      case 'weak-password':
        return ApiResponse(
          isSuccessful: false,
          message: 'he password provided is too weak.',
        );

      case 'email-already-in-use':
        return ApiResponse(
          isSuccessful: false,
          message: 'The account already exists for that email',
        );

      default:
        return ApiResponse(
          isSuccessful: false,
          message: e.code.replaceAll(RegExp(r'-'), ' '),
        );
    }
  }
}
