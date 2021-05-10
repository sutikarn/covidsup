import 'package:firebase_auth/firebase_auth.dart';

class GoogleLoginService {

  Future<bool> checkFirebaseLogin() async {
    if (FirebaseAuth.instance.currentUser != null)
      return true;
    else
      return false;
 }
}