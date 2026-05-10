import 'package:firebase_auth/firebase_auth.dart';

String handleAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'No account found with this email.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'too-many-requests':
      return 'Too many requests. Please try again later.';
    default:
      return 'An unexpected error occurred. Please try again.';
  }
}