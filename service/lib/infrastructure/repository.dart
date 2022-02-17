import 'package:dartz/dartz.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

const _categories = [
  Category(name: 'Category 1'),
  Category(name: 'Category 2'),
  Category(name: 'Category 3'),
  Category(name: 'Category 4'),
  Category(name: 'Category 5'),
  Category(name: 'Category 6'),
];

const _services = [
  Service(name: 'Service 1'),
  Service(name: 'Service 2'),
  Service(name: 'Service 3'),
  Service(name: 'Service 4'),
  Service(name: 'Service 5'),
  Service(name: 'Service 6'),
];

class ServiceRepository implements IServiceRepository {
  @override
  Future<Option<List<Category>>> getCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return optionOf(_categories);
    } catch (_) {
      return optionOf(null);
    }
  }

  @override
  Future<Option<List<Service>>> getServices() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return optionOf(_services);
    } catch (_) {
      return optionOf(null);
    }
  }

  @override
  Future<Either<ServiceFailure, Unit>> book(Service service) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return right(unit);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }
}



// class FirebaseAuthFacade implements IServiceRepository {
//   FirebaseAuthFacade();

//   final _user = User(id: UniqueId());

//   @override
//   Future<Option<User>> getSignedInUser() async => optionOf(_user);

//   @override
//   Future<Either<ServiceFailure, Unit>> registerWithEmailAndPassword(
//       {required EmailAddress emailAddress, required Password password}) async {
//     // final emailAddressStr = emailAddress.getOrCrash();
//     // final passwordStr = password.getOrCrash();

//     emailAddress.getOrCrash();
//     password.getOrCrash();
//     try {
//       await Future.delayed(const Duration(seconds: 1));
//       return right(unit);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//         return left(const ServiceFailure.emailAlreadyInUse());
//       } else {
//         return left(const ServiceFailure.serverError());
//       }
//     }
//   }

//   @override
//   Future<Either<ServiceFailure, Unit>> signInWithEmailAndPassword({
//     required EmailAddress emailAddress,
//     required Password password,
//   }) async {
//     // final emailAddressStr = emailAddress.getOrCrash();
//     // final passwordStr = password.getOrCrash();
//     emailAddress.getOrCrash();
//     password.getOrCrash();
//     try {
//       await Future.delayed(const Duration(seconds: 1));
//       return right(unit);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'ERROR_WRONG_PASSWORD' ||
//           e.code == 'ERROR_USER_NOT_FOUND') {
//         return left(const ServiceFailure.invalidEmailAndPasswordCombination());
//       } else {
//         return left(const ServiceFailure.serverError());
//       }
//     }
//   }

//   @override
//   Future<Either<ServiceFailure, Unit>> signInWithGoogle() async {
//     await Future.delayed(const Duration(seconds: 1));
//     try {
//       // final googleUser = await _googleSignIn.signIn();
//       // if (googleUser == null) {
//       //   return left(const ServiceFailure.cancelledByUser());
//       // }

//       // final googleAuthentication = await googleUser.authentication;

//       // final authCredential = GoogleAuthProvider.credential(
//       //   idToken: googleAuthentication.idToken,
//       //   accessToken: googleAuthentication.accessToken,
//       // );

//       // await _firebaseAuth.signInWithCredential(authCredential);
//       return right(unit);
//     } on FirebaseAuthException catch (_) {
//       return left(const ServiceFailure.serverError());
//     }
//   }

//   @override
//   Future<void> signOut() {
//     return Future.wait([Future.delayed(const Duration(seconds: 1))]);
//   }

//   @override
//   Future<Either<ServiceFailure, Unit>> forgetPassword(
//       {required Phone phone}) async {
//     // final phoneStr = phone.getOrCrash();
//     phone.getOrCrash();
//     try {
//       await Future.delayed(const Duration(seconds: 1));
//       // final googleUser = await _googleSignIn.signIn();
//       // if (googleUser == null) {
//       //   return left(const ServiceFailure.cancelledByUser());
//       // }

//       // final googleAuthentication = await googleUser.authentication;

//       // final authCredential = GoogleAuthProvider.credential(
//       //   idToken: googleAuthentication.idToken,
//       //   accessToken: googleAuthentication.accessToken,
//       // );

//       // await _firebaseAuth.signInWithCredential(authCredential);
//       return right(unit);
//     } on FirebaseAuthException catch (_) {
//       return left(const ServiceFailure.serverError());
//     }
//   }

//   @override
//   Future<Option<List<Category>>> getCategories() async {
//     try {
//       await Future.delayed(const Duration(seconds: 1));

//       return optionOf(_categories);
//     } catch (_) {
//       return optionOf(null);
//     }
//   }
// }
