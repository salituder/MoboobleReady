import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobooble/domain/user.dart' as my;

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<my.User> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      my.User user = my.User(result.user.uid);
      return my.User(user.id);

    }catch(e){
      print(e);
      return null;
    }
  }

  Future logOut() async{
    await _fAuth.signOut();


  }

  Stream<my.User> get currentUser{
    return _fAuth.authStateChanges().map((event) => event != null ? my.User(event.uid) : null);
  }
}
