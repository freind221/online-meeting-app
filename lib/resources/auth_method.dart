import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zome_clone/utilis/toast.dart';

class AuthMethod {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => firebaseAuth.authStateChanges();
  User get user => firebaseAuth.currentUser!;

  Future<bool> signInWithGoogle() async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credentials);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'id': user.uid,
            'photo': user.photoURL
          }).then((value) {
            Utilis.toatsMessage('User got logged in');
          }).onError((error, stackTrace) {
            Utilis.toatsMessage(error.toString());
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      Utilis.toatsMessage(e.toString());
      res = false;
    }
    return res;
  }
}
