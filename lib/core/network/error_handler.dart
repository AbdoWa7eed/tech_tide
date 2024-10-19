import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/utils/extensions.dart';

abstract class ErrorHandler {
  static Failure handleException(dynamic e) {
    if (e is FirebaseAuthException) {
      return _handleAuthError(e);
    } else if (e is FirebaseException) {
      return _handleFirestoreError(e);
    } else if (e is Failure) {
      return e;
    } else {
      return Failure(message: e.toString());
    }
  }

  static Failure _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Failure(message: ErrorMessages.invalidEmail.translate);
      case 'user-not-found':
        return Failure(message: ErrorMessages.userNotFound.translate);
      case 'invalid-credential':
        return Failure(message: ErrorMessages.invalidCredentials.translate);
      case 'email-already-in-use':
        return Failure(message: ErrorMessages.emailAlreadyInUse.translate);
      default:
        return Failure(message: ErrorMessages.authenticationFailed.translate);
    }
  }

  static Failure _handleFirestoreError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return Failure(message: ErrorMessages.permissionDenied.translate);
      case 'not-found':
        return Failure(message: ErrorMessages.documentNotFound.translate);
      case 'already_exists':
        return Failure(message: ErrorMessages.documentExists.translate);
      default:
        return Failure(message: ErrorMessages.databaseError.translate);
    }
  }
}
