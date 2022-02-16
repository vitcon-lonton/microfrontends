import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/user.dart';
import 'package:auth/domain/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

class FirebaseAuthFacade implements IAuthFacade {
  final _user = User(id: UniqueId());

  FirebaseAuthFacade();

  @override
  Future<Option<User>> getSignedInUser() async => optionOf(_user);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    // final emailAddressStr = emailAddress.getOrCrash();
    // final passwordStr = password.getOrCrash();

    emailAddress.getOrCrash();
    password.getOrCrash();
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    // final emailAddressStr = emailAddress.getOrCrash();
    // final passwordStr = password.getOrCrash();
    emailAddress.getOrCrash();
    password.getOrCrash();
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      // final googleUser = await _googleSignIn.signIn();
      // if (googleUser == null) {
      //   return left(const AuthFailure.cancelledByUser());
      // }

      // final googleAuthentication = await googleUser.authentication;

      // final authCredential = GoogleAuthProvider.credential(
      //   idToken: googleAuthentication.idToken,
      //   accessToken: googleAuthentication.accessToken,
      // );

      // await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([Future.delayed(const Duration(seconds: 1))]);
  }
}



// class FirebaseAuthFacade implements IAuthFacade {
//   final FirebaseAuth _firebaseAuth;
//   final GoogleSignIn _googleSignIn;

//   FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

//   @override
//   Future<Option<User>> getSignedInUser() async =>
//       optionOf(_firebaseAuth.currentUser?.toDomain());

//   @override
//   Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
//     required EmailAddress emailAddress,
//     required Password password,
//   }) async {
//     final emailAddressStr = emailAddress.getOrCrash();
//     final passwordStr = password.getOrCrash();
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(
//         email: emailAddressStr,
//         password: passwordStr,
//       );
//       return right(unit);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//         return left(const AuthFailure.emailAlreadyInUse());
//       } else {
//         return left(const AuthFailure.serverError());
//       }
//     }
//   }

//   @override
//   Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
//     required EmailAddress emailAddress,
//     required Password password,
//   }) async {
//     final emailAddressStr = emailAddress.getOrCrash();
//     final passwordStr = password.getOrCrash();
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//         email: emailAddressStr,
//         password: passwordStr,
//       );
//       return right(unit);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'ERROR_WRONG_PASSWORD' ||
//           e.code == 'ERROR_USER_NOT_FOUND') {
//         return left(const AuthFailure.invalidEmailAndPasswordCombination());
//       } else {
//         return left(const AuthFailure.serverError());
//       }
//     }
//   }

//   @override
//   Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
//     try {
//       final googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return left(const AuthFailure.cancelledByUser());
//       }

//       final googleAuthentication = await googleUser.authentication;

//       final authCredential = GoogleAuthProvider.credential(
//         idToken: googleAuthentication.idToken,
//         accessToken: googleAuthentication.accessToken,
//       );

//       await _firebaseAuth.signInWithCredential(authCredential);
//       return right(unit);
//     } on FirebaseAuthException catch (_) {
//       return left(const AuthFailure.serverError());
//     }
//   }

//   @override
//   Future<void> signOut() =>
//       Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
// }
