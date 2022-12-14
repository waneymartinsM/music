import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> _createBucket(
      UserCredential credential,
      String b64ProfilePic,
      ) async {
    final String? userUid = _auth.currentUser?.uid;
    final storageRef = _storage.ref();

    if (userUid != null) {
      final userStorageRef = storageRef.child('$userUid/profile');
      try {
        await userStorageRef.putString(
          b64ProfilePic,
          format: PutStringFormat.base64,
        );
        return userStorageRef.getDownloadURL();
      } on FirebaseException catch (e) {
        log(e.toString());
      }
    }
    return null;
  }

  Future<UserCredential?> loginWithEmailAndPass(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> registerWithEmailAndPassword(
      String username,
      String email,
      String password,
      String b64ProfilePic,
      ) async {
    return await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (credential) => credential.user?.updateDisplayName(username).then(
            (value) => _createBucket(credential, b64ProfilePic).then(
              (value) => credential.user?.updatePhotoURL(value),
        ),
      ),
    );
  }

  Future<void> logOut() async {
    return await _auth.signOut();
  }
}
