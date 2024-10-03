import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:srh360app/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up with Email and Password
  Future<void> signUpWithEmail(String email, String password, String name, String role, String phoneNumber) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the newly created user's UID
      String uid = userCredential.user?.uid ?? '';

      // Save additional user info in Firestore
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'role': role,
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });

    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  // Sign In with Email and Password
  Future<void> signInWithEmail(String email, String password) async {
    try {
      // Sign in with email and password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    

  
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Get the Current User's UID
  String? getCurrentUserUID() {
    // Return the UID of the currently signed-in user (if any)
    return _auth.currentUser?.uid;
  }

  // Fetch the current user's data from Firestore
  Future<UserModel?> getCurrentUserInfo() async {
    try {
      // Get the current user's UID
      String? uid = getCurrentUserUID();

      if (uid != null) {
        // Fetch the user's document from Firestore
        DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();

        if (doc.exists) {
          // Create and return a UserModel from the document data
          return UserModel.fromMap(doc.data() as Map<String, dynamic>, uid);
        }
      }
    } catch (e) {
      throw Exception('Failed to fetch user info: $e');
    }
    return null;
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      // Sign out the current user
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
